import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: backToHome, icon: Icon(Icons.arrow_back_ios)),
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  'Nike Shope 2024 lates model - New Year special deal',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
                ItemCount(
                  initialValue: 0,
                  minValue: 0,
                  maxValue: 10,
                  decimalPlaces: 0,
                  color: AppColors.themeColor,
                  onChanged: (value) {
                    // Handle counter value changes
                    print('Selected value: $value');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void backToHome() {
  return Get.find<BottomNavBarController>().backToHome();
}
