import 'package:intl/intl.dart';

class PCCompleteSalesRequestModel {
  PCCompleteSalesRequestModel({
    required this.header,
    required this.transactionResult,
    required this.printSlip,
  });

  /// Slip basılıp basılmayacağı bilgisi bu alana set edilecek. “1”: slip basılacak , “2” :slip basılmayacak
  String printSlip;

  /// Body'de gönderilecek header modeli
  PCHeaderForCompleteSalesModel header;

  /// Milisaniye cinsinden slipler arası bekleme süresinin ne kadar olacağı belirlenecek.
  int slipEstimatedTime = 1000;

  int bankSlipEstimatedTime = 10;

  /// İşlem sonlandırmak istenden durumudur. “1”: İşlem başarılı “2”: İşlem başarısız
  int transactionResult;

  Map<String, dynamic> toJson() => {
        'PrintSlip': printSlip,
        'header': header.toJson(),
        'slipEstimatedTime': slipEstimatedTime,
        'transactionResult': transactionResult,
        'bankSlipEstimatedTime': bankSlipEstimatedTime,
      };
}

class PCHeaderForCompleteSalesModel {
  PCHeaderForCompleteSalesModel({
    required this.clientKey,
    required this.application,
    required this.transactionId,
    required this.packageName,
  });

  /// Servis kullanımı için önceden paylaşılacak, servis güvenlik parametresi
  String application;

  /// productionda "com.procenne.mpos" developmentda "com.procenne.mpos.turkcellmenu.test2"
  String packageName;

  /// "PaycellMPOS" olarak verilecek.
  String clientKey;

  /// Satış tamamlama isteğinin request ID'si
  String requestId = '2';

  String transactionStep = '1';

  /// İşlem tarihi aşağıda verilen formatta
  String transactionDate = DateFormat('yyyymmddHHMMSS').format(DateTime.now());

  /// İşleme verilen uniq id (numara, guid formatında)
  String transactionId;

  Map<String, dynamic> toJson() => {
        'application': application,
        'packageName': packageName,
        'ClientKey': clientKey,
        'requestId': requestId,
        'transactionDate': transactionDate,
        'transactionId': transactionId,
        'transactionStep': transactionStep,
      };
}
