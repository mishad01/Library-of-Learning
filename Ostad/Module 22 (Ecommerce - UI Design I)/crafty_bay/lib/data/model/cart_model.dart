import 'package:crafty_bay/data/model/product_model.dart';

class CartModel {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  String? qty;
  String? price;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  CartModel(
      {this.id,
      this.userId,
      this.productId,
      this.color,
      this.size,
      this.qty,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? new ProductModel.fromJson(json['product'])
        : null;
  }
}
