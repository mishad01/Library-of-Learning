import 'package:crafty_bay/data/model/invoice_create_data.dart';

class InvoiceCreateModel {
  String? msg;
  List<InvoiceCreateData>? data;

  InvoiceCreateModel({this.msg, this.data});

  InvoiceCreateModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <InvoiceCreateData>[];
      json['data'].forEach((v) {
        data!.add(new InvoiceCreateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
