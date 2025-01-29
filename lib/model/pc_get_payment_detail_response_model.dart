import 'package:background_json_parser/background_json_parser.dart';

class PcGetPaymentDetailResponseModel extends IBaseModel<PcGetPaymentDetailResponseModel> {
  PcGetPaymentDetailResponseHeaderModel? header;
  PcGetPaymentDetailResponseOperationResultModel? operationResult;
  PcGetPaymentDetailResponseTransactionDetailsModel? transactionDetails;

  PcGetPaymentDetailResponseModel({
    this.header,
    this.operationResult,
    this.transactionDetails,
  });

  @override
  fromJson(Map<String, dynamic> json) => PcGetPaymentDetailResponseModel(
        header: json["header"] == null ? null : PcGetPaymentDetailResponseHeaderModel.fromJson(json["header"]),
        operationResult: json["operationResult"] == null
            ? null
            : PcGetPaymentDetailResponseOperationResultModel.fromJson(json["operationResult"]),
        transactionDetails: json["transactionDetails"] == null
            ? null
            : PcGetPaymentDetailResponseTransactionDetailsModel.fromJson(json["transactionDetails"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "header": header?.toJson(),
        "operationResult": operationResult?.toJson(),
        "transactionDetails": transactionDetails?.toJson(),
      };
}

class PcGetPaymentDetailResponseHeaderModel {
  String? mposUniqueId;
  String? application;
  String? packageName;
  String? requestId;
  String? transactionDate;
  String? transactionId;

  PcGetPaymentDetailResponseHeaderModel({
    this.mposUniqueId,
    this.application,
    this.packageName,
    this.requestId,
    this.transactionDate,
    this.transactionId,
  });

  factory PcGetPaymentDetailResponseHeaderModel.fromJson(Map<String, dynamic> json) =>
      PcGetPaymentDetailResponseHeaderModel(
        mposUniqueId: json["MPOSUniqueId"],
        application: json["application"],
        packageName: json["packageName"],
        requestId: json["requestId"],
        transactionDate: json["transactionDate"],
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "MPOSUniqueId": mposUniqueId,
        "application": application,
        "packageName": packageName,
        "requestId": requestId,
        "transactionDate": transactionDate,
        "transactionId": transactionId,
      };
}

class PcGetPaymentDetailResponseOperationResultModel {
  String? resultCode;
  String? resultDesc;

  PcGetPaymentDetailResponseOperationResultModel({
    this.resultCode,
    this.resultDesc,
  });

  factory PcGetPaymentDetailResponseOperationResultModel.fromJson(Map<String, dynamic> json) =>
      PcGetPaymentDetailResponseOperationResultModel(
        resultCode: json["resultCode"],
        resultDesc: json["resultDesc"],
      );

  Map<String, dynamic> toJson() => {
        "resultCode": resultCode,
        "resultDesc": resultDesc,
      };
}

class PcGetPaymentDetailResponseTransactionDetailsModel {
  PcGetPaymentDetailResponseCardModel? card;
  PcGetPaymentDetailResponseInvoiceModel? invoice;
  bool? isDigitalSlip;
  String? oeName;
  int? paymentTypeId;
  String? transactionType;

  // 1 = BEFORE_BKM
  // 2 = AFTER_BKM
  // 3 = BEFORE_CREATE_INVOICE
  // 4 = AFTER_CREATE_INVOICE
  // 5 = BEFORE_SEND_ADVICE
  // 6 = AFTER_SEND_ADVICE
  // 7 = BEFORE_PRINT_SLIP
  // 8 = AFTER_PRINT_SLIP
  // 9 = PROCESS_COMPLETED
  String? statusCode;

  // 1 İşlem Askıda
  // 2 Satış Başarılı
  // 3 Satış Başarılı
  // 4 İptal Başarılı
  // 5 İade Başarılı
  // 6 Başarısız
  // 7 Parçalı İade Başarılı
  // 8 Eşleniksiz İade İptali Başarılı
  // 9 Parçalı İade İptali Başarılı
  // 61 Özel Entegratör Hatası Alındı, İşlem Başarısız
  int? txnStep;

  PcGetPaymentDetailResponseTransactionDetailsModel({
    this.card,
    this.invoice,
    this.isDigitalSlip,
    this.oeName,
    this.paymentTypeId,
    this.transactionType,
    this.statusCode,
    this.txnStep,
  });

  factory PcGetPaymentDetailResponseTransactionDetailsModel.fromJson(Map<String, dynamic> json) =>
      PcGetPaymentDetailResponseTransactionDetailsModel(
        card: json["card"] == null ? null : PcGetPaymentDetailResponseCardModel.fromJson(json["card"]),
        invoice: json["invoice"] == null ? null : PcGetPaymentDetailResponseInvoiceModel.fromJson(json["invoice"]),
        isDigitalSlip: json["isDigitalSlip"],
        oeName: json["OEName"],
        paymentTypeId: json["PaymentTypeId"],
        transactionType: json["transactionType"],
        statusCode: json["statusCode"],
        txnStep: json["TxnStep"],
      );

  Map<String, dynamic> toJson() => {
        "card": card?.toJson(),
        "invoice": invoice?.toJson(),
        "isDigitalSlip": isDigitalSlip,
        "OEName": oeName,
        "PaymentTypeId": paymentTypeId,
        "transactionType": transactionType,
        "statusCode": statusCode,
        "TxnStep": txnStep,
      };
}

class PcGetPaymentDetailResponseCardModel {
  String? acquirerId;
  String? bankRefNo;
  String? bin;
  String? cardNumberMasked;
  String? isOnus;
  String? issuerId;
  String? paymentInterface;
  String? provisionNo;
  String? rrn;

  PcGetPaymentDetailResponseCardModel({
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

  factory PcGetPaymentDetailResponseCardModel.fromJson(Map<String, dynamic> json) =>
      PcGetPaymentDetailResponseCardModel(
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

class PcGetPaymentDetailResponseInvoiceModel {
  PcGetPaymentDetailResponseInvoiceMerchantModel? invoiceMerchant;
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

  PcGetPaymentDetailResponseInvoiceModel({
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

  factory PcGetPaymentDetailResponseInvoiceModel.fromJson(Map<String, dynamic> json) =>
      PcGetPaymentDetailResponseInvoiceModel(
        invoiceMerchant: json["invoiceMerchant"] == null
            ? null
            : PcGetPaymentDetailResponseInvoiceMerchantModel.fromJson(json["invoiceMerchant"]),
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
        "invoiceInvoiceDate":
            "${invoiceInvoiceDate!.year.toString().padLeft(4, '0')}-${invoiceInvoiceDate!.month.toString().padLeft(2, '0')}-${invoiceInvoiceDate!.day.toString().padLeft(2, '0')}",
        "invoiceNo": invoiceNo,
        "invoiceNumber": invoiceNumber,
        "invoiceRef": invoiceRef,
        "invoiceType": invoiceType,
      };
}

class PcGetPaymentDetailResponseInvoiceMerchantModel {
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

  PcGetPaymentDetailResponseInvoiceMerchantModel({
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

  factory PcGetPaymentDetailResponseInvoiceMerchantModel.fromJson(Map<String, dynamic> json) =>
      PcGetPaymentDetailResponseInvoiceMerchantModel(
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
