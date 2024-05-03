import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:paycellpos_plugin/paycellpos_plugin_platform_interface.dart';
import 'model/complete_sales_request_model.dart';
import 'model/pc_sales_request_model.dart';
import 'model/pc_sales_response_model.dart';

enum PaycellPosStatusCodeEnum {
  qrPaymentSuccessfulCode(3002), // QR ÖDEME BAŞARILI KODU
  bankCreditSuccessful(3006), // BANKA KREDİ BAŞARILI
  istanbulCardPaymentSuccessful(3008), // İSTANBUL KART ÖDEME BAŞARILI
  mkeSalesBankSuccessful(3016), // MKE satış banka başarılı
  installmentWar(3034), // Taksitli Savaş
  successfulRefundProcess(200), // iade işleminde başarılı
  successfulCancelProcess1(3062), // iptal işleminde başarılı
  successfulCancelProcess2(3071), // MKE iptal banka başarılı durumu
  invoiceCreationCashSuccess(3010), // Fatura oluşturma nakit başarılı durumu 3010
  provisionClosureBankSuccess(3019), // Provizyon Kapama banka başarılı durumu 3019
  pointQueryBankSuccess(3031), // Puan sorgu banka başarılı durumu 3031
  pointUsageBankSuccess(3039), // Puan Kullanım banka başarılı durumu 3039
  batchProvisionOpeningBankSuccess(3044), // Batch Dışı Provizyon Acma banka başarılı 3044
  provisionOpeningBankSuccess(3047), // Provizyon Açma banka başarılı durumu 3047
  pairedRefundBankSuccess(3051), // Eşlenikli iade banka başarılı durumu 3051
  unpairedRefundBankSuccess(3055), // Eşleniksiz iade banka başarılı durumu 3055
  invoiceCancellationCashSuccess(3059), // Fatura iptal nakit başarılı durumu 3059
  istanbulkartCancellationSuccess(3064), // Istanbulkart iptal işlem başarılı 3064
  offlineTransactionSuccess(3079), // Offline işlem başarılı gönderim 3079
  offlineTransactionCancellationBankSuccess(3080), // Offline işlem iptalinde banka bildiriminin başarılı olması 3080
  cancellationSuccess2(3082), // İptal İşleminin Başarılı Olması2 3082
  offlineTransactionCompletionSuccess(3084), // Offline İşlemin Başarılı Olarak Tamamlanması 3084
  nonSaleOfflineTransactionSuccess(3086), // Satış Dışındaki Offline İşlemin Başarılı Olması 3086
  offlineTransactionSuccessfulCompletion(3091), // Offline İşlem Başarılı Tamamlandı 3091
  saleMKESuccess(3093), // Satış MKE Başarılı Olunması 3093
  offlineProvisionClosureSuccess(3095), // Provizyon Kapama Offline Başarılı 3095
  offlinePointQuerySuccess(3096), // Puan Sorgu Oflline Başarılı 3096
  offlinePointUsageSuccess(3097), // Offline Puan Kullanım Başarılı 3097
  nonBatchProvisionOpeningOfflineSuccess(3098), // Batch Dışı Ön provizyon Açma Offline Başarılı 3098
  offlineProvisionOpeningSuccess(3099), // Offline Provizyon Açma Başarılı 3099
  offlineRefundSuccess(3100), // Offline İade Başarılı 3100
  offlineUnpairedRefundSuccess(3101), // Offline Eşleniksiz İade Başarılı 3101
  offlineTransactionCancellationNotificationBankSuccess(
      3102), // Offline İşlem İptalinin Başarılı Bildirimi (Banka) 3102
  installmentSaleOfflineSuccess(3104); // Taksitli Satış Offline Başarılı 3104

  final int statusCode;

  const PaycellPosStatusCodeEnum(this.statusCode);
}

class PaycellposPlugin {
  PaycellposPlugin._();

  static PaycellposPlugin? _instance;

  factory PaycellposPlugin() => _instance ??= PaycellposPlugin._();

  Future<void> startAndCompleteOperation({
    PCSalesRequestModel? startSalesOperationReqModel,
    Map<String, dynamic>? startSalesOperationReqMap,
    VoidCallback? onPosBusy,
    VoidCallback? onPosNotInstalled,
    Function(String)? onError,
    Future<void> Function(PCSalesResponseModel, String)? onSuccess,
    Function(String?)? onNotSuccess,
  }) async {
    assert(startSalesOperationReqModel != null || startSalesOperationReqMap != null);
    startSalesOperationReqMap ??= startSalesOperationReqModel!.toJson();
    final reqHeaderMap = startSalesOperationReqMap['header'];
    final String transactionId = reqHeaderMap['transactionId'];
    final String application = reqHeaderMap['application'];
    final String clientKey = reqHeaderMap['ClientKey'];
    final String printSlip = startSalesOperationReqMap['PrintSlip'] ?? '1';
    final int timeout = startSalesOperationReqMap['timeout'] ?? 5;
    final header = PCHeaderForCompleteSalesModel(
      application: application,
      clientKey: clientKey,
      transactionId: transactionId,
    );
    try {
      if (!Platform.isAndroid) {
        completeSalesOperation(header, 2, printSlip);
        onPosNotInstalled?.call();
        return;
      }

      final reqJson = jsonEncode(startSalesOperationReqMap);
      print('---->$reqJson');
      final response = await PaycellposPluginPlatform.instance.startOperation(reqJson);
      print('<----$response');
      if (response == null) throw Exception();

      if (response == 'Mpos is busy.') {
        completeSalesOperation(header, 2, printSlip);
        onPosBusy?.call();
        return;
      }

      if (response == 'Mpos isn\'t installed.') {
        completeSalesOperation(header, 2, printSlip);
        onPosNotInstalled?.call();
        return;
      }

      final mPosSalesResultAsModel = PCSalesResponseModel.fromJson(jsonDecode(response));
      final result = PaycellPosStatusCodeEnum.values.any(
        (element) => element.statusCode.toString() == mPosSalesResultAsModel.operationResult!.resultCode,
      );
      if (result) {
        final int duration = timeout - (timeout == 0 ? 0 : 1);
        await onSuccess?.call(mPosSalesResultAsModel, transactionId).timeout(Duration(seconds: duration)).catchError((_, __) {});
        completeSalesOperation(header, 1, printSlip);
      } else {
        completeSalesOperation(header, 2, printSlip);
        onNotSuccess?.call(mPosSalesResultAsModel.operationResult!.resultCode);
      }
    } catch (e) {
      completeSalesOperation(header, 2, printSlip);
      onError?.call(e.toString());
    }
  }

  void completeSalesOperation(PCHeaderForCompleteSalesModel header, int transactionResult, String printSlip) {
    try {
      /// slip 2 requeste mi basılacak
      if (printSlip != '0') return;
      final model = PCCompleteSalesRequestModel(
        header: header,
        transactionResult: transactionResult,
        printSlip: '1',
      );
      final String json = jsonEncode(model.toJson());
      print('---->$json');
      PaycellposPluginPlatform.instance.completeOperation(json).then((res) => print('<----$res'));
    } catch (_) {}
  }
}
