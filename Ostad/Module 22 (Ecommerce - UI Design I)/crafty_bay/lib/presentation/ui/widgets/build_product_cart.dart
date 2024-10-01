import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProductCart extends StatelessWidget {
  const BuildProductCart({
    super.key,
    required this.productList,
  });
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductDetailsScreen());
        },
        child: ListView.builder(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return product_card2(
              popularProduct: productList[index],
            );
          },
        ),
      ),
    );
  }
}
