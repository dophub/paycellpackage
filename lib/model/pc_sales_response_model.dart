import 'package:background_json_parser/background_json_parser.dart';

class PCSalesResponseModel extends IBaseModel<PCSalesResponseModel> {
  PCHeaderModel? header;
  PCOperationResultModel? operationResult;
  PCTransactionDetailsModel? transactionDetails;

  PCSalesResponseModel({
    this.header,
    this.operationResult,
    this.transactionDetails,
  });

  PCSalesResponseModel copyWith({
    PCHeaderModel? header,
    PCOperationResultModel? operationResult,
    PCTransactionDetailsModel? transactionDetails,
  }) =>
      PCSalesResponseModel(
        header: header ?? this.header,
        operationResult: operationResult ?? this.operationResult,
        transactionDetails: transactionDetails ?? this.transactionDetails,
      );

  @override
  fromJson(Map<String, dynamic> json) => PCSalesResponseModel(
        header: json["header"] == null ? null : PCHeaderModel.fromJson(json["header"]),
        operationResult:
            json["operationResult"] == null ? null : PCOperationResultModel.fromJson(json["operationResult"]),
        transactionDetails:
            json["transactionDetails"] == null ? null : PCTransactionDetailsModel.fromJson(json["transactionDetails"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "header": header?.toJson(),
        "operationResult": operationResult?.toJson(),
        "transactionDetails": transactionDetails?.toJson(),
      };
}

class PCHeaderModel {
  String? mposUniqueId;
  String? application;
  String? mainPaymentUniqueId;
  String? packageName;
  String? requestId;
  String? transactionDate;
  String? transactionId;

  PCHeaderModel({
    this.mposUniqueId,
    this.application,
    this.mainPaymentUniqueId,
    this.packageName,
    this.requestId,
    this.transactionDate,
    this.transactionId,
  });

  PCHeaderModel copyWith({
    String? mposUniqueId,
    String? application,
    String? mainPaymentUniqueId,
    String? packageName,
    String? requestId,
    String? transactionDate,
    String? transactionId,
  }) =>
      PCHeaderModel(
        mposUniqueId: mposUniqueId ?? this.mposUniqueId,
        application: application ?? this.application,
        mainPaymentUniqueId: mainPaymentUniqueId ?? this.mainPaymentUniqueId,
        packageName: packageName ?? this.packageName,
        requestId: requestId ?? this.requestId,
        transactionDate: transactionDate ?? this.transactionDate,
        transactionId: transactionId ?? this.transactionId,
      );

  factory PCHeaderModel.fromJson(Map<String, dynamic> json) => PCHeaderModel(
        mposUniqueId: json["MPOSUniqueId"],
        application: json["application"],
        mainPaymentUniqueId: json["mainPaymentUniqueId"],
        packageName: json["packageName"],
        requestId: json["requestId"],
        transactionDate: json["transactionDate"],
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "MPOSUniqueId": mposUniqueId,
        "application": application,
        "mainPaymentUniqueId": mainPaymentUniqueId,
        "packageName": packageName,
        "requestId": requestId,
        "transactionDate": transactionDate,
        "transactionId": transactionId,
      };
}

class PCOperationResultModel {
  String? resultCode;
  String? resultDesc;

  PCOperationResultModel({
    this.resultCode,
    this.resultDesc,
  });

  PCOperationResultModel copyWith({
    String? resultCode,
    String? resultDesc,
  }) =>
      PCOperationResultModel(
        resultCode: resultCode ?? this.resultCode,
        resultDesc: resultDesc ?? this.resultDesc,
      );

  factory PCOperationResultModel.fromJson(Map<String, dynamic> json) => PCOperationResultModel(
        resultCode: json["resultCode"],
        resultDesc: json["resultDesc"],
      );

  Map<String, dynamic> toJson() => {
        "resultCode": resultCode,
        "resultDesc": resultDesc,
      };
}

class PCTransactionDetailsModel {
  PCCardModel? card;
  PCInvoiceModel? invoice;
  List<PCProductListModel>? urunListesi;
  List<String>? invoiceSlip;
  bool? isDigitalSlip;
  String? oeName;
  DateTime? orderDate;
  String? orderNumber;
  int? paymentTypeId;
  String? transactionType;
  String? txnId;
  int? txnStep;

  PCTransactionDetailsModel({
    this.card,
    this.invoice,
    this.urunListesi,
    this.invoiceSlip,
    this.isDigitalSlip,
    this.oeName,
    this.orderDate,
    this.orderNumber,
    this.paymentTypeId,
    this.transactionType,
    this.txnId,
    this.txnStep,
  });

  PCTransactionDetailsModel copyWith({
    PCCardModel? card,
    PCInvoiceModel? invoice,
    List<PCProductListModel>? urunListesi,
    List<String>? invoiceSlip,
    bool? isDigitalSlip,
    String? oeName,
    DateTime? orderDate,
    String? orderNumber,
    int? paymentTypeId,
    String? transactionType,
    String? txnId,
    int? txnStep,
  }) =>
      PCTransactionDetailsModel(
        card: card ?? this.card,
        invoice: invoice ?? this.invoice,
        urunListesi: urunListesi ?? this.urunListesi,
        invoiceSlip: invoiceSlip ?? this.invoiceSlip,
        isDigitalSlip: isDigitalSlip ?? this.isDigitalSlip,
        oeName: oeName ?? this.oeName,
        orderDate: orderDate ?? this.orderDate,
        orderNumber: orderNumber ?? this.orderNumber,
        paymentTypeId: paymentTypeId ?? this.paymentTypeId,
        transactionType: transactionType ?? this.transactionType,
        txnId: txnId ?? this.txnId,
        txnStep: txnStep ?? this.txnStep,
      );

  factory PCTransactionDetailsModel.fromJson(Map<String, dynamic> json) => PCTransactionDetailsModel(
        card: json["card"] == null ? null : PCCardModel.fromJson(json["card"]),
        invoice: json["invoice"] == null ? null : PCInvoiceModel.fromJson(json["invoice"]),
        urunListesi: json["urunListesi"] == null
            ? []
            : List<PCProductListModel>.from(json["urunListesi"]!.map((x) => PCProductListModel.fromJson(x))),
        invoiceSlip: json["invoiceSlip"] == null ? [] : List<String>.from(json["invoiceSlip"]!.map((x) => x)),
        isDigitalSlip: json["isDigitalSlip"],
        oeName: json["OEName"],
        orderDate: json["OrderDate"] == null ? null : DateTime.parse(json["OrderDate"]),
        orderNumber: json["OrderNumber"],
        paymentTypeId: json["PaymentTypeId"],
        transactionType: json["transactionType"],
        txnId: json["TxnId"],
        txnStep: json["TxnStep"],
      );

  Map<String, dynamic> toJson() => {
        "card": card?.toJson(),
        "invoice": invoice?.toJson(),
        "urunListesi": urunListesi == null ? [] : List<dynamic>.from(urunListesi!.map((x) => x.toJson())),
        "invoiceSlip": invoiceSlip == null ? [] : List<dynamic>.from(invoiceSlip!.map((x) => x)),
        "isDigitalSlip": isDigitalSlip,
        "OEName": oeName,
        "OrderDate": orderDate?.toIso8601String(),
        "OrderNumber": orderNumber,
        "PaymentTypeId": paymentTypeId,
        "transactionType": transactionType,
        "TxnId": txnId,
        "TxnStep": txnStep,
      };
}

class PCCardModel {
  String? acquirerId;
  String? bankRefNo;
  String? bin;
  String? cardNumberMasked;
  String? isOnus;
  String? issuerId;
  String? paymentInterface;
  String? provisionNo;
  String? rrn;

  PCCardModel({
    this.acquirerId,
    this.bankRefNo,
    this.bin,
    this.cardNumberMasked,
    this.isOnus,
    this.issuerId,
    this.paymentInterface,
    this.provisionNo,
    this.rrn,
  });

  PCCardModel copyWith({
    String? acquirerId,
    String? bankRefNo,
    String? bin,
    String? cardNumberMasked,
    String? isOnus,
    String? issuerId,
    String? paymentInterface,
    String? provisionNo,
    String? rrn,
  }) =>
      PCCardModel(
        acquirerId: acquirerId ?? this.acquirerId,
        bankRefNo: bankRefNo ?? this.bankRefNo,
        bin: bin ?? this.bin,
        cardNumberMasked: cardNumberMasked ?? this.cardNumberMasked,
        isOnus: isOnus ?? this.isOnus,
        issuerId: issuerId ?? this.issuerId,
        paymentInterface: paymentInterface ?? this.paymentInterface,
        provisionNo: provisionNo ?? this.provisionNo,
        rrn: rrn ?? this.rrn,
      );

  factory PCCardModel.fromJson(Map<String, dynamic> json) => PCCardModel(
        acquirerId: json["AcquirerId"],
        bankRefNo: json["bankRefNo"],
        bin: json["Bin"],
        cardNumberMasked: json["CardNumberMasked"],
        isOnus: json["isOnus"],
        issuerId: json["IssuerId"],
        paymentInterface: json["PaymentInterface"],
        provisionNo: json["ProvisionNo"],
        rrn: json["RRN"],
      );

  Map<String, dynamic> toJson() => {
        "AcquirerId": acquirerId,
        "bankRefNo": bankRefNo,
        "Bin": bin,
        "CardNumberMasked": cardNumberMasked,
        "isOnus": isOnus,
        "IssuerId": issuerId,
        "PaymentInterface": paymentInterface,
        "ProvisionNo": provisionNo,
        "RRN": rrn,
      };
}

class PCInvoiceModel {
  PCInvoiceMerchantModel? invoiceMerchant;
  String? batchId;
  String? invoiceAmount;
  String? invoiceCurrency;
  String? invoiceCustomerAddress;
  String? invoiceCustomerEmail;
  String? invoiceCustomerName;
  String? invoiceCustomerSurName;
  String? invoiceCustomerTckn;
  String? invoiceCustomerTelefon;
  String? invoiceCustomerTitle;
  DateTime? invoiceDate;
  String? invoiceEttn;
  DateTime? invoiceInvoiceDate;
  String? invoiceNo;
  String? invoiceNumber;
  String? invoiceRef;
  String? invoiceType;

  PCInvoiceModel({
    this.invoiceMerchant,
    this.batchId,
    this.invoiceAmount,
    this.invoiceCurrency,
    this.invoiceCustomerAddress,
    this.invoiceCustomerEmail,
    this.invoiceCustomerName,
    this.invoiceCustomerSurName,
    this.invoiceCustomerTckn,
    this.invoiceCustomerTelefon,
    this.invoiceCustomerTitle,
    this.invoiceDate,
    this.invoiceEttn,
    this.invoiceInvoiceDate,
    this.invoiceNo,
    this.invoiceNumber,
    this.invoiceRef,
    this.invoiceType,
  });

  PCInvoiceModel copyWith({
    PCInvoiceMerchantModel? invoiceMerchant,
    String? batchId,
    String? invoiceAmount,
    String? invoiceCurrency,
    String? invoiceCustomerAddress,
    String? invoiceCustomerEmail,
    String? invoiceCustomerName,
    String? invoiceCustomerSurName,
    String? invoiceCustomerTckn,
    String? invoiceCustomerTelefon,
    String? invoiceCustomerTitle,
    DateTime? invoiceDate,
    String? invoiceEttn,
    DateTime? invoiceInvoiceDate,
    String? invoiceNo,
    String? invoiceNumber,
    String? invoiceRef,
    String? invoiceType,
  }) =>
      PCInvoiceModel(
        invoiceMerchant: invoiceMerchant ?? this.invoiceMerchant,
        batchId: batchId ?? this.batchId,
        invoiceAmount: invoiceAmount ?? this.invoiceAmount,
        invoiceCurrency: invoiceCurrency ?? this.invoiceCurrency,
        invoiceCustomerAddress: invoiceCustomerAddress ?? this.invoiceCustomerAddress,
        invoiceCustomerEmail: invoiceCustomerEmail ?? this.invoiceCustomerEmail,
        invoiceCustomerName: invoiceCustomerName ?? this.invoiceCustomerName,
        invoiceCustomerSurName: invoiceCustomerSurName ?? this.invoiceCustomerSurName,
        invoiceCustomerTckn: invoiceCustomerTckn ?? this.invoiceCustomerTckn,
        invoiceCustomerTelefon: invoiceCustomerTelefon ?? this.invoiceCustomerTelefon,
        invoiceCustomerTitle: invoiceCustomerTitle ?? this.invoiceCustomerTitle,
        invoiceDate: invoiceDate ?? this.invoiceDate,
        invoiceEttn: invoiceEttn ?? this.invoiceEttn,
        invoiceInvoiceDate: invoiceInvoiceDate ?? this.invoiceInvoiceDate,
        invoiceNo: invoiceNo ?? this.invoiceNo,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        invoiceRef: invoiceRef ?? this.invoiceRef,
        invoiceType: invoiceType ?? this.invoiceType,
      );

  factory PCInvoiceModel.fromJson(Map<String, dynamic> json) => PCInvoiceModel(
        invoiceMerchant: json["invoiceMerchant"] == null ? null : PCInvoiceMerchantModel.fromJson(json["invoiceMerchant"]),
        batchId: json["BatchId"],
        invoiceAmount: json["invoiceAmount"],
        invoiceCurrency: json["invoiceCurrency"],
        invoiceCustomerAddress: json["invoiceCustomerAddress"],
        invoiceCustomerEmail: json["invoiceCustomerEmail"],
        invoiceCustomerName: json["invoiceCustomerName"],
        invoiceCustomerSurName: json["invoiceCustomerSurName"],
        invoiceCustomerTckn: json["invoiceCustomerTCKN"],
        invoiceCustomerTelefon: json["invoiceCustomerTelefon"],
        invoiceCustomerTitle: json["invoiceCustomerTitle"],
        invoiceDate: json["invoiceDate"] == null ? null : DateTime.parse(json["invoiceDate"]),
        invoiceEttn: json["invoiceETTN"],
        invoiceInvoiceDate: json["invoiceInvoiceDate"] == null ? null : DateTime.parse(json["invoiceInvoiceDate"]),
        invoiceNo: json["invoiceNo"],
        invoiceNumber: json["invoiceNumber"],
        invoiceRef: json["invoiceRef"],
        invoiceType: json["invoiceType"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceMerchant": invoiceMerchant?.toJson(),
        "BatchId": batchId,
        "invoiceAmount": invoiceAmount,
        "invoiceCurrency": invoiceCurrency,
        "invoiceCustomerAddress": invoiceCustomerAddress,
        "invoiceCustomerEmail": invoiceCustomerEmail,
        "invoiceCustomerName": invoiceCustomerName,
        "invoiceCustomerSurName": invoiceCustomerSurName,
        "invoiceCustomerTCKN": invoiceCustomerTckn,
        "invoiceCustomerTelefon": invoiceCustomerTelefon,
        "invoiceCustomerTitle": invoiceCustomerTitle,
        "invoiceDate": invoiceDate?.toIso8601String(),
        "invoiceETTN": invoiceEttn,
        "invoiceInvoiceDate": invoiceInvoiceDate?.toIso8601String(),
        "invoiceNo": invoiceNo,
        "invoiceNumber": invoiceNumber,
        "invoiceRef": invoiceRef,
        "invoiceType": invoiceType,
      };
}

class PCInvoiceMerchantModel {
  int? exclusiveIntegratorDefinitionId;
  String? invoiceMerchantAddress;
  String? invoiceMerchantCity;
  String? invoiceMerchantDistrict;
  String? invoiceMerchantEmail;
  String? invoiceMerchantGsm;
  int? invoiceMerchantId;
  String? invoiceMerchantMersisNo;
  String? invoiceMerchantName;
  String? invoiceMerchantTaxNo;
  String? invoiceMerchantTaxOffice;
  String? invoiceMerchantTelephone;
  String? invoiceMerchantTitle;

  PCInvoiceMerchantModel({
    this.exclusiveIntegratorDefinitionId,
    this.invoiceMerchantAddress,
    this.invoiceMerchantCity,
    this.invoiceMerchantDistrict,
    this.invoiceMerchantEmail,
    this.invoiceMerchantGsm,
    this.invoiceMerchantId,
    this.invoiceMerchantMersisNo,
    this.invoiceMerchantName,
    this.invoiceMerchantTaxNo,
    this.invoiceMerchantTaxOffice,
    this.invoiceMerchantTelephone,
    this.invoiceMerchantTitle,
  });

  PCInvoiceMerchantModel copyWith({
    int? exclusiveIntegratorDefinitionId,
    String? invoiceMerchantAddress,
    String? invoiceMerchantCity,
    String? invoiceMerchantDistrict,
    String? invoiceMerchantEmail,
    String? invoiceMerchantGsm,
    int? invoiceMerchantId,
    String? invoiceMerchantMersisNo,
    String? invoiceMerchantName,
    String? invoiceMerchantTaxNo,
    String? invoiceMerchantTaxOffice,
    String? invoiceMerchantTelephone,
    String? invoiceMerchantTitle,
  }) =>
      PCInvoiceMerchantModel(
        exclusiveIntegratorDefinitionId: exclusiveIntegratorDefinitionId ?? this.exclusiveIntegratorDefinitionId,
        invoiceMerchantAddress: invoiceMerchantAddress ?? this.invoiceMerchantAddress,
        invoiceMerchantCity: invoiceMerchantCity ?? this.invoiceMerchantCity,
        invoiceMerchantDistrict: invoiceMerchantDistrict ?? this.invoiceMerchantDistrict,
        invoiceMerchantEmail: invoiceMerchantEmail ?? this.invoiceMerchantEmail,
        invoiceMerchantGsm: invoiceMerchantGsm ?? this.invoiceMerchantGsm,
        invoiceMerchantId: invoiceMerchantId ?? this.invoiceMerchantId,
        invoiceMerchantMersisNo: invoiceMerchantMersisNo ?? this.invoiceMerchantMersisNo,
        invoiceMerchantName: invoiceMerchantName ?? this.invoiceMerchantName,
        invoiceMerchantTaxNo: invoiceMerchantTaxNo ?? this.invoiceMerchantTaxNo,
        invoiceMerchantTaxOffice: invoiceMerchantTaxOffice ?? this.invoiceMerchantTaxOffice,
        invoiceMerchantTelephone: invoiceMerchantTelephone ?? this.invoiceMerchantTelephone,
        invoiceMerchantTitle: invoiceMerchantTitle ?? this.invoiceMerchantTitle,
      );

  factory PCInvoiceMerchantModel.fromJson(Map<String, dynamic> json) => PCInvoiceMerchantModel(
        exclusiveIntegratorDefinitionId: json["ExclusiveIntegratorDefinitionId"],
        invoiceMerchantAddress: json["invoiceMerchantAddress"],
        invoiceMerchantCity: json["invoiceMerchantCity"],
        invoiceMerchantDistrict: json["invoiceMerchantDistrict"],
        invoiceMerchantEmail: json["invoiceMerchantEmail"],
        invoiceMerchantGsm: json["invoiceMerchantGsm"],
        invoiceMerchantId: json["invoiceMerchantId"],
        invoiceMerchantMersisNo: json["invoiceMerchantMersisNo"],
        invoiceMerchantName: json["invoiceMerchantName"],
        invoiceMerchantTaxNo: json["invoiceMerchantTaxNo"],
        invoiceMerchantTaxOffice: json["invoiceMerchantTaxOffice"],
        invoiceMerchantTelephone: json["invoiceMerchantTelephone"],
        invoiceMerchantTitle: json["invoiceMerchantTitle"],
      );

  Map<String, dynamic> toJson() => {
        "ExclusiveIntegratorDefinitionId": exclusiveIntegratorDefinitionId,
        "invoiceMerchantAddress": invoiceMerchantAddress,
        "invoiceMerchantCity": invoiceMerchantCity,
        "invoiceMerchantDistrict": invoiceMerchantDistrict,
        "invoiceMerchantEmail": invoiceMerchantEmail,
        "invoiceMerchantGsm": invoiceMerchantGsm,
        "invoiceMerchantId": invoiceMerchantId,
        "invoiceMerchantMersisNo": invoiceMerchantMersisNo,
        "invoiceMerchantName": invoiceMerchantName,
        "invoiceMerchantTaxNo": invoiceMerchantTaxNo,
        "invoiceMerchantTaxOffice": invoiceMerchantTaxOffice,
        "invoiceMerchantTelephone": invoiceMerchantTelephone,
        "invoiceMerchantTitle": invoiceMerchantTitle,
      };
}

class PCProductListModel {
  String? birim;
  String? birimFiyat;
  String? kdvTutari;
  String? kdvOrani;
  String? malHizmet;
  String? miktar;
  String? productId;
  String? toplamKdvTutari;

  PCProductListModel({
    this.birim,
    this.birimFiyat,
    this.kdvTutari,
    this.kdvOrani,
    this.malHizmet,
    this.miktar,
    this.productId,
    this.toplamKdvTutari,
  });

  PCProductListModel copyWith({
    String? birim,
    String? birimFiyat,
    String? kdvTutari,
    String? kdvOrani,
    String? malHizmet,
    String? miktar,
    String? productId,
    String? toplamKdvTutari,
  }) =>
      PCProductListModel(
        birim: birim ?? this.birim,
        birimFiyat: birimFiyat ?? this.birimFiyat,
        kdvTutari: kdvTutari ?? this.kdvTutari,
        kdvOrani: kdvOrani ?? this.kdvOrani,
        malHizmet: malHizmet ?? this.malHizmet,
        miktar: miktar ?? this.miktar,
        productId: productId ?? this.productId,
        toplamKdvTutari: toplamKdvTutari ?? this.toplamKdvTutari,
      );

  factory PCProductListModel.fromJson(Map<String, dynamic> json) => PCProductListModel(
        birim: json["Birim"],
        birimFiyat: json["BirimFiyat"],
        kdvTutari: json["KDVTutari"],
        kdvOrani: json["KdvOrani"],
        malHizmet: json["MalHizmet"],
        miktar: json["Miktar"],
        productId: json["ProductId"],
        toplamKdvTutari: json["ToplamKDVTutari"],
      );

  Map<String, dynamic> toJson() => {
        "Birim": birim,
        "BirimFiyat": birimFiyat,
        "KDVTutari": kdvTutari,
        "KdvOrani": kdvOrani,
        "MalHizmet": malHizmet,
        "Miktar": miktar,
        "ProductId": productId,
        "ToplamKDVTutari": toplamKdvTutari,
      };
}
