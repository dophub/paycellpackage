import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PCSalesHeaderModel {
  PCSalesHeaderModel({
    required this.clientKey,
    required this.application,
  });

  /// Servis kullanımı için önceden paylaşılacak, servis güvenlik parametresi
  String application;

  /// "PaycellMPOS" olarak verilecek.
  String clientKey;

  /// Satış tamamlama isteğinin request ID'si
  String requestId = '2';

  /// İşlem tarihi aşağıda verilen formatta
  String transactionDate = DateFormat('yyyymmddHHMMSS').format(DateTime.now());

  /// İşleme verilen uniq id (numara, guid formatında)
  String transactionId = const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'application': application,
        'ClientKey': clientKey,
        'requestId': requestId,
        'transactionDate': transactionDate,
        'transactionId': transactionId,
      };
}
