import 'package:intl/intl.dart';

import '../const/enum.dart';

class PCSalesRequestModel {
  PCSalesRequestModel({
    this.customer,
    required this.header,
    required this.refNo,
    required this.invoiceStatus,
    required this.methodType,
    required this.printSlip,
    required this.products,
    required this.subMerchantId,
    required this.totalAmount,
    required this.totalKdvAmount,
    required this.dgpNo,
    required this.printingOption,
  });

  /// 500 liranın üzerinde zorunlu, 500 liranın altında opsiyonel olarak verilmesi gereken müşteri bilgileri
  PCCustomerForStartSalesRequestModel? customer;

  /// Her cihaz için ayrı olan OKC_SERIAL_NUMBER
  String dgpNo;

  /// Timeout a göre yapılacak işlem durumu (0:başarısız,1:başarılı)
  String endTxnStatus = '1';

  /// Body'de gönderilecek header modeli
  PCHeaderForStartSalesModel header;

  /// “1”: fatura kesilecek, “0”: fatura kesilmeyecek.
  String invoiceStatus;

  /// Satış türü bilgisi gönderilecek.
  /// 1 : SALES_CASH (Nakit Satış)
  /// -1 : SALES_CASH_VOID (Nakit Satış İptali) 2 : SALES_CARD (Kartlı Satış)
  /// -2 : SALES_CARD_VOID (Kartlı Satış İptali) 3 : REFUND (İade)
  /// -3 : REFUND_VOID (İadenin iptali)
  PaycellMethodType methodType;

  String refNo;

  /// Kurum tarafından işleme özel verilen bir kategori var ise bu alana set edilecek.
  String orderType = '';

  /// Slip basılması için request 2 beklenip beklenmeyeceğini belirleyen parametredir.
  /// 0 ise Slip basmak için request 2 yi bekle
  /// 1 ise request 1 sonucunda slibi bas anlamı taşır.
  String printSlip;

  /// Product
  List<PCProductForSalesRequestModel> products;

  /// Milisaniye cinsinden slipler arası bekleme süresinin ne kadar olacağı belirlenecek.
  int slipEstimatedTime = 4000;

  /// Turkcell işlemlerinde alt işlem tipi bilgisi
  String subMerchantId;

  /// Apptoapp yapılan uygulamaya gönderilen birinci ve ikinci
  /// request arasındaki süre.
  /// (tercihe bağlı olarak sn bazlı süre kullanılabilir)
  int timeout = 5;

  ///  Toplam işlem tutarı. 100 ile çarpılarak gönderilecek
  double totalAmount;

  ///  Toplam kdv tutarı. 100 ile çarpılarak gönderilecek
  double totalKdvAmount;

  /// hengi sliplerin basılacağını belitmek için kullanılır
  /// Bu alan gelmezse aşağıdaki alanlar false gelmiş olarak kabul edilir ve tüm slipler print edilir.
  /// BKM dijital slip geliştirmesi kapsamında banka slipleri iletilmezse 2.Parametre dikkate alınmayacaktır.
  PCPrintingOptionForSalesRequestModel printingOption;

  Map<String, dynamic> toJson() => {
        "customer": customer?.toJson(),
        "DGPNo": dgpNo,
        "endTxnStatus": endTxnStatus,
        "header": header.toJson(),
        "invoiceStatus": invoiceStatus,
        "methodType": methodType.type,
        "orderType": orderType,
        "PrintSlip": printSlip,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "refNo": refNo,
        "slipEstimatedTime": slipEstimatedTime,
        "SubMerchantId": subMerchantId,
        "timeout": timeout,
        "totalAmount": (totalAmount * 100).round().toString(),
        "totalKDVAmount": (totalKdvAmount * 100).round().toString(),
        "PrintingOption": printingOption.toJson(),
      };
}

class PCCustomerForStartSalesRequestModel {
  PCCustomerForStartSalesRequestModel({
    this.customerAddress,
    this.customerAlias,
    this.customerIsCorporate,
    this.customerMail,
    this.customerName,
    this.customerPhone,
    this.customerSurname,
    this.customerTckn,
    this.customerTaxAdmin,
    this.customerVkn,
  });

  /// Musteri Adresi
  String? customerAddress;

  /// Musteri Unvanı
  String? customerAlias;

  /// "1" kurumsal vkn girilmeli 10 hane "0" bireysel tckn girilmeli
  String? customerIsCorporate;

  /// Musteri Mail
  String? customerMail;

  /// Musteri İsim
  String? customerName;

  /// Musteri Telefon
  String? customerPhone;

  /// Musteri Soyisim
  String? customerSurname;

  /// Musteri TC
  String? customerTckn;

  /// Musteri Vergi Dairesi
  String? customerTaxAdmin;

  /// Musteri Vergi Kimlik Numarası
  String? customerVkn;

  factory PCCustomerForStartSalesRequestModel.fromJson(Map<String, dynamic> json) =>
      PCCustomerForStartSalesRequestModel(
        customerAddress: json["customerAddress"],
        customerAlias: json["customerAlias"],
        customerIsCorporate: json["customerIsCorporate"],
        customerMail: json["customerMail"],
        customerName: json["customerName"],
        customerPhone: json["customerPhone"],
        customerSurname: json["customerSurname"],
        customerTckn: json["customerTCKN"],
        customerTaxAdmin: json["customerTaxAdmin"],
        customerVkn: json["customerVKN"],
      );

  Map<String, dynamic> toJson() => {
        "customerAddress": customerAddress,
        "customerAlias": customerAlias,
        "customerIsCorporate": customerIsCorporate,
        "customerMail": customerMail,
        "customerName": customerName,
        "customerPhone": customerPhone,
        "customerSurname": customerSurname,
        "customerTCKN": customerTckn,
        "customerTaxAdmin": customerTaxAdmin,
        "customerVKN": customerVkn,
      };
}

class PCHeaderForStartSalesModel {
  PCHeaderForStartSalesModel({
    required this.transactionId,
    required this.clientKey,
    required this.application,
    required this.packageName,
    required this.sequentialNo,
    required this.dateTime,
  });

  DateTime dateTime;

  /// "PaycellMPOS" olarak verilecek.
  String application;

  /// Servis kullanımı için önceden paylaşılacak, servis güvenlik parametresi
  String clientKey;

  /// Hash için kullanılacak, rastgele üretilen değer. "" boş gönderilebilir.
  String hash = "";

  /// Satış başlatma isteğinin request ID'si
  String requestId = '1';

  /// Terminal Id gönderilebilir
  String sequentialNo;

  /// İşleme verilen uniq id (numara, guid formatında)
  String transactionId;

  /// 1 veya boş gönderilebilir
  String transactionStep = '1';

  /// productionda "com.procenne.mpos" developmentda "com.procenne.mpos.turkcellmenu.test2"
  String packageName;

  Map<String, dynamic> toJson() => {
        "application": application,
        "ClientKey": clientKey,
        "Hash": hash,
        "requestId": requestId,
        "sequentialNo": sequentialNo,
        "transactionDate": DateFormat('yyyymmddHHMMSS').format(dateTime),
        "transactionId": transactionId,
        "transactionStep": transactionStep,
        "packageName": packageName,
      };
}

class PCProductForSalesRequestModel {
  PCProductForSalesRequestModel({
    required this.productAmount,
    required this.productCount,
    required this.productKdvAmount,
    required this.productKdvRate,
    required this.productName,
  });

  /// Ürün fiyatı 100 ile çarpılacak
  double productAmount;

  /// Ürün adeti
  int productCount;

  /// Ürün bilgisi
  String? productInfo;

  /// Ürün Kdv Tutarı 100 ile çarpılacak
  double productKdvAmount;

  /// Ürün Kdv Oranı
  int productKdvRate;

  /// Ürün İsmi
  String productName;

  Map<String, dynamic> toJson() => {
        "productAmount": (productAmount * 100).round().toString(),
        "productCount": productCount.toString(),
        "productKDVAmount": (productKdvAmount * 100).round().toString(),
        "productKDVRate": productKdvRate.toString(),
        "productName": productName,
      };
}

class PCPrintingOptionForSalesRequestModel {
  PCPrintingOptionForSalesRequestModel({
    required this.belge,
    required this.customerCopy,
    required this.merchantCopy,
  });

  /// Bilgi Fişi ya da e- belge’nin print edilip edilmeyceğini gösteren flag
  /// true= Print edilsin false= Print edilmesin
  final bool belge;

  /// Banka slibin müşteri nüshası
  /// true= Print edilsin false= Print edilmesin
  final bool customerCopy;

  /// Banka slibin işyeri nüshası
  /// true= Print edilsin false= Print edilmesin
  final bool merchantCopy;

  Map<String, dynamic> toJson() => {
        "Belge": belge,
        "CustomerCopy": customerCopy,
        "MerchantCopy": merchantCopy,
      };
}
