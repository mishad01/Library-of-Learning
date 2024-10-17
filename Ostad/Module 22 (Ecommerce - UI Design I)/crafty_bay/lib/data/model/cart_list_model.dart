import 'package:crafty_bay/data/model/cart_model.dart';

class CartListModel {
  String? msg;
  List<CartModel>? cartListdata;

  CartListModel({this.msg, this.cartListdata});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartListdata = <CartModel>[];
      json['data'].forEach((v) {
        cartListdata!.add(new CartModel.fromJson(v));
      });
    }
  }
}
