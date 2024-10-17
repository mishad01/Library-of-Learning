import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class product_card2 extends StatelessWidget {
  const product_card2({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductDetailsScreen(productId: product.id!));
        },
        child: Card(
          elevation: 2,
          child: Column(
            children: [
              Container(
                width: 120,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0), // Padding for the image
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.image ?? ""),
                        fit: BoxFit
                            .cover, // Adjusts the image size within the padding
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 120,
                // height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('\$${product.price}',
                            style: TextStyle(
                                color: AppColors.themeColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12)),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text(
                              '${product.star}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
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
                              size: 17,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
