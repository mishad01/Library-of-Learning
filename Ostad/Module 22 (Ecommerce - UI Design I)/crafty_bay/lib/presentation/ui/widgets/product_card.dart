/*
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen());
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: 129,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage(
                    AssetsPath.shoeImage,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? "",
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('\$${product.title}',
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(width: 5),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${product.star ?? ""}',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: AppColors.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                            Icons.favorite_outline_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    //return BuildProductCart();
  }
}
*/
