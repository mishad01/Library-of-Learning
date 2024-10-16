import 'package:crafty_bay/data/model/wish_list_model.dart';

class WishListProduct {
  String? msg;
  List<WishListModel>? wishListData;

  WishListProduct({this.msg, this.wishListData});

  WishListProduct.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishListData = <WishListModel>[];
      json['data'].forEach((v) {
        wishListData!.add(new WishListModel.fromJson(v));
      });
    }
  }
}
