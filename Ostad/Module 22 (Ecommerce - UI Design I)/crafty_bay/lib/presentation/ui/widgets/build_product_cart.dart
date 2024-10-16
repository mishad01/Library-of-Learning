import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card2.dart';
import 'package:flutter/material.dart';

class BuildProductCart extends StatelessWidget {
  const BuildProductCart({
    super.key,
    required this.productList,
  });
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //Get.to(() => ProductDetailsScreen(productId: productId));
            },
            child: product_card2(
              product: productList[index],
            ),
          );
        },
      ),
    );
  }
}
