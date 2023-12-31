import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:paycellpos_plugin/paycellpos_plugin_platform_interface.dart';
import 'model/complete_sales_request_model.dart';
import 'model/pc_sales_header_model.dart';
import 'model/pc_sales_request_model.dart';
import 'model/pc_sales_response_model.dart';

enum PaycellPosStatusCodeEnum {
  qrPaymentSuccessfulCode(3002), // QR ÖDEME BAŞARILI KODU
  bankCreditSuccessful(3006), // BANKA KREDİ BAŞARILI
  istanbulCardPaymentSuccessful(3008), // İSTANBUL KART ÖDEME BAŞARILI
  mkeSalesBankSuccessful(3016), // MKE satış banka başarılı
  installmentWar(3034), // Taksitli Savaş
  successfulRefundProcess(200), // iade işleminde başarılı
  successfulCancelProcess(3062); // iptal işleminde başarılı

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
    Function(PCSalesResponseModel, String)? onSuccess,
    Function(String?)? onNotSuccess,
  }) async {
    assert(startSalesOperationReqModel != null || startSalesOperationReqMap != null);
    startSalesOperationReqMap ??= startSalesOperationReqModel!.toJson();
    final reqHeaderMap = startSalesOperationReqMap['header'];
    String application = reqHeaderMap['application'];
    String clientKey = reqHeaderMap['ClientKey'];
    String transactionId = reqHeaderMap['transactionId'];
    final header = PCSalesHeaderModel(
      application: application,
      clientKey: clientKey,
    );
    try {
      if (!Platform.isAndroid) {
        completeSalesOperation(header, 2);
        onPosNotInstalled?.call();
        return;
      }

      final response = await PaycellposPluginPlatform.instance.startOperation(jsonEncode(startSalesOperationReqMap));
      if (response == null) throw Exception();

      if (response == 'Mpos is busy.') {
        completeSalesOperation(header, 2);
        onPosBusy?.call();
        return;
      }

      if (response == 'Mpos isn\'t installed.') {
        completeSalesOperation(header, 2);
        onPosNotInstalled?.call();
        return;
      }

      final mPosSalesResultAsModel = PCSalesResponseModel.fromJson(jsonDecode(response));
      final result = PaycellPosStatusCodeEnum.values.any(
        (element) => element.statusCode.toString() == mPosSalesResultAsModel.operationResult!.resultCode,
      );
      if (result) {
        completeSalesOperation(header, 1);
        onSuccess?.call(mPosSalesResultAsModel, transactionId);
      } else {
        completeSalesOperation(header, 2);
        onNotSuccess?.call(mPosSalesResultAsModel.operationResult!.resultCode);
      }
    } catch (e) {
      completeSalesOperation(header, 2);
      onError?.call(e.toString());
    }
  }

  void completeSalesOperation(PCSalesHeaderModel header, int transactionResult) {
    final model = PCCompleteSalesRequestModel(header: header, transactionResult: transactionResult);
    PaycellposPluginPlatform.instance.completeOperation(jsonEncode(model.toJson()));
  }
}
