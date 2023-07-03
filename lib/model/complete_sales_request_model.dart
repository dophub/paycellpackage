import 'package:paycellpos_plugin/model/pc_sales_header_model.dart';

class PCCompleteSalesRequestModel {
  PCCompleteSalesRequestModel({
    required this.header,
    required this.transactionResult,
  });

  /// Slip basılıp basılmayacağı bilgisi bu alana set edilecek. “1”: slip basılacak , “2” :slip basılmayacak
  String printSlip = '1';

  /// Body'de gönderilecek header modeli
  PCSalesHeaderModel header;

  /// Milisaniye cinsinden slipler arası bekleme süresinin ne kadar olacağı belirlenecek.
  int slipEstimatedTime = 1000;

  /// İşlem sonlandırmak istenden durumudur. “1”: İşlem başarılı “2”: İşlem başarısız
  int transactionResult;

  Map<String, dynamic> toJson() => {
        'PrintSlip': printSlip,
        'header': header.toJson(),
        'slipEstimatedTime': slipEstimatedTime,
        'transactionResult': transactionResult,
      };
}
