import 'package:crafty_bay/data/model/review_list_model.dart';

class ReviewModel {
  int? id;
  String? description;
  String? rating;
  int? customerId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  ReviewModel(
      {this.id,
      this.description,
      this.rating,
      this.customerId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.profile});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    rating = json['rating'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }
}
