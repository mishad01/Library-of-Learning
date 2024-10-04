/*class ProductDetailsModel {
  String? msg;
  List<Data>? data;

  ProductDetailsModel({this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
}*/

import 'package:crafty_bay/data/model/product_model.dart';

class ProductDetailsModel {
  int? id;
  String? img1;
  String? img2;
  String? img3;
  String? img4;
  String? des;
  String? color;
  String? size;
  int? productId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  ProductDetailsModel(
      {this.id,
      this.img1,
      this.img2,
      this.img3,
      this.img4,
      this.des,
      this.color,
      this.size,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.product});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
    des = json['des'];
    color = json['color'];
    size = json['size'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? new ProductModel.fromJson(json['product'])
        : null;
  }
}
