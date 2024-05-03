class PCSalesResponseModel {
  PCSalesResponseModel({
    this.mposUniqueId,
    this.card,
    this.invoice,
    this.urunListesi,
    this.header,
    this.oeName,
    this.operationResult,
    this.orderDate,
    this.orderNumber,
    this.transactionType,
    this.txnId,
  });

  String? mposUniqueId;
  PCCardModel? card;
  PCInvoiceModel? invoice;
  List<PCProductListModel>? urunListesi;
  PCHeaderModel? header;
  String? oeName;
  PCOperationResultModel? operationResult;
  DateTime? orderDate;
  String? orderNumber;
  String? transactionType;
  String? txnId;

  PCSalesResponseModel copyWith({
    String? mposUniqueId,
    PCCardModel? card,
    PCInvoiceModel? invoice,
    List<PCProductListModel>? urunListesi,
    PCHeaderModel? header,
    String? oeName,
    PCOperationResultModel? operationResult,
    DateTime? orderDate,
    String? orderNumber,
    String? transactionType,
    String? txnId,
  }) =>
      PCSalesResponseModel(
        mposUniqueId: mposUniqueId ?? this.mposUniqueId,
        card: card ?? this.card,
        invoice: invoice ?? this.invoice,
        urunListesi: urunListesi ?? this.urunListesi,
        header: header ?? this.header,
        oeName: oeName ?? this.oeName,
        operationResult: operationResult ?? this.operationResult,
        orderDate: orderDate ?? this.orderDate,
        orderNumber: orderNumber ?? this.orderNumber,
        transactionType: transactionType ?? this.transactionType,
        txnId: txnId ?? this.txnId,
      );

  factory PCSalesResponseModel.fromJson(Map<String, dynamic> json) => PCSalesResponseModel(
        mposUniqueId: json["MPOSUniqueId"],
        card: json["card"] == null ? null : PCCardModel.fromJson(json["card"]),
        invoice: json["invoice"] == null ? null : PCInvoiceModel.fromJson(json["invoice"]),
        urunListesi: json["urunListesi"] == null
            ? []
            : List<PCProductListModel>.from(json["urunListesi"]!.map((x) => PCProductListModel.fromJson(x))),
        header: json["header"] == null ? null : PCHeaderModel.fromJson(json["header"]),
        oeName: json["OEName"],
        operationResult:
            json["operationResult"] == null ? null : PCOperationResultModel.fromJson(json["operationResult"]),
        orderDate: json["OrderDate"] == null ? null : DateTime.parse(json["OrderDate"]),
        orderNumber: json["OrderNumber"],
        transactionType: json["transactionType"],
        txnId: json["TxnId"],
      );

  Map<String, dynamic> toJson() => {
        "MPOSUniqueId": mposUniqueId,
        "card": card?.toJson(),
        "invoice": invoice?.toJson(),
        "urunListesi": urunListesi == null ? [] : List<dynamic>.from(urunListesi!.map((x) => x.toJson())),
        "header": header?.toJson(),
        "OEName": oeName,
        "operationResult": operationResult?.toJson(),
        "OrderDate": orderDate?.toIso8601String(),
        "OrderNumber": orderNumber,
        "transactionType": transactionType,
        "TxnId": txnId,
      };
}

class PCCardModel {
  PCCardModel({
    this.bankRefNo,
    this.paymentInterface,
    this.acquirerId,
    this.bin,
    this.cardNumberMasked,
    this.isOnus,
    this.issuerId,
    this.provisionNo,
    this.rrn,
  });

  String? bankRefNo;
  String? paymentInterface;
  String? acquirerId;
  String? bin;
  String? cardNumberMasked;
  String? isOnus;
  String? issuerId;
  String? provisionNo;
  String? rrn;

  factory PCCardModel.fromJson(Map<String, dynamic> json) => PCCardModel(
        bankRefNo: json["bankRefNo"],
        paymentInterface: json["PaymentInterface"],
        acquirerId: json["AcquirerId"],
        bin: json["Bin"],
        cardNumberMasked: json["CardNumberMasked"],
        isOnus: json["isOnus"],
        issuerId: json["IssuerId"],
        provisionNo: json["ProvisionNo"],
      );

  Map<String, dynamic> toJson() => {
        "bankRefNo": bankRefNo,
        "PaymentInterface": paymentInterface,
        "AcquirerId": acquirerId,
        "Bin": bin,
        "CardNumberMasked": cardNumberMasked,
        "isOnus": isOnus,
        "IssuerId": issuerId,
        "ProvisionNo": provisionNo,
      };
}

class PCHeaderModel {
  PCHeaderModel({
    this.application,
    this.clientKey,
    this.hash,
    this.requestId,
    this.transactionDate,
    this.transactionId,
  });

  String? application;
  String? clientKey;
  String? hash;
  String? requestId;
  String? transactionDate;
  String? transactionId;

  PCHeaderModel copyWith({
    String? application,
    String? clientKey,
    String? hash,
    String? requestId,
    String? transactionDate,
    String? transactionId,
  }) =>
      PCHeaderModel(
        application: application ?? this.application,
        clientKey: clientKey ?? this.clientKey,
        hash: hash ?? this.hash,
        requestId: requestId ?? this.requestId,
        transactionDate: transactionDate ?? this.transactionDate,
        transactionId: transactionId ?? this.transactionId,
      );

  factory PCHeaderModel.fromJson(Map<String, dynamic> json) => PCHeaderModel(
        application: json["application"],
        clientKey: json["ClientKey"],
        hash: json["Hash"],
        requestId: json["requestId"],
        transactionDate: json["transactionDate"],
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "application": application,
        "ClientKey": clientKey,
        "Hash": hash,
        "requestId": requestId,
        "transactionDate": transactionDate,
        "transactionId": transactionId,
      };
}

class PCInvoiceModel {
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
        invoiceMerchant:
            json["invoiceMerchant"] == null ? null : PCInvoiceMerchantModel.fromJson(json["invoiceMerchant"]),
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
    this.invoiceMerchantSicilNo,
    this.invoiceMerchantTaxNo,
    this.invoiceMerchantTaxOffice,
    this.invoiceMerchantTelephone,
    this.invoiceMerchantTitle,
  });

  int? exclusiveIntegratorDefinitionId;
  String? invoiceMerchantAddress;
  String? invoiceMerchantCity;
  String? invoiceMerchantDistrict;
  String? invoiceMerchantEmail;
  String? invoiceMerchantGsm;
  int? invoiceMerchantId;
  String? invoiceMerchantMersisNo;
  String? invoiceMerchantName;
  String? invoiceMerchantSicilNo;
  String? invoiceMerchantTaxNo;
  String? invoiceMerchantTaxOffice;
  String? invoiceMerchantTelephone;
  String? invoiceMerchantTitle;

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
    String? invoiceMerchantSicilNo,
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
        invoiceMerchantSicilNo: invoiceMerchantSicilNo ?? this.invoiceMerchantSicilNo,
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
        invoiceMerchantSicilNo: json["invoiceMerchantSicilNo"],
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
        "invoiceMerchantSicilNo": invoiceMerchantSicilNo,
        "invoiceMerchantTaxNo": invoiceMerchantTaxNo,
        "invoiceMerchantTaxOffice": invoiceMerchantTaxOffice,
        "invoiceMerchantTelephone": invoiceMerchantTelephone,
        "invoiceMerchantTitle": invoiceMerchantTitle,
      };
}

class PCOperationResultModel {
  PCOperationResultModel({
    this.resultCode,
    this.resultDesc,
  });

  String? resultCode;
  String? resultDesc;

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

class PCProductListModel {
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

  String? birim;
  String? birimFiyat;
  String? kdvTutari;
  String? kdvOrani;
  String? malHizmet;
  String? miktar;
  String? productId;
  String? toplamKdvTutari;

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
