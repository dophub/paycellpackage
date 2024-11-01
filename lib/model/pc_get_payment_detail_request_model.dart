import 'package:background_json_parser/background_json_parser.dart';
import 'package:paycellpos_plugin/model/pc_sales_request_model.dart';

class PCGetPaymentDetailRequestModel extends IBaseModel<PCGetPaymentDetailRequestModel> {
  String methodType = '1';

  /// Body'de gönderilecek header modeli
  PCHeaderForStartSalesModel header;

  PCGetPaymentDetailRequestModel({
    required this.header,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "methodType": methodType,
      "header": header.toJson(),
    };
  }

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
