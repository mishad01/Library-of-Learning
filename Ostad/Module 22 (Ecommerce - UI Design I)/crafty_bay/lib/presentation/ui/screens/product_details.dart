import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/reviews_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          leading: IconButton(
              onPressed: () {
                Get.off(() => MainBottomNavbarScreen());
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
              child: buildProductDetails(),
            ),
            buildPriceAndAddToCartSection(),
          ],
        ),
      ),
    );
  }

  Widget buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNameAndQuantitySection(),
                _buildRatingAndReviewSection(),
                SizedBox(height: 8),
                ColorPicker(
                  colors: const [
                    Colors.black,
                    AppColors.themeColor,
                    Colors.brown,
                    Colors.blueAccent,
                    Colors.grey,
                  ],
                  onSelectedColor: (color) {},
                ),
                SizedBox(height: 16),
                SizePicker(
                  sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                  onSelectedColor: (p0) {},
                ),
                SizedBox(height: 16),
                Text('Description',
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                    textAlign: TextAlign.justify,
                    'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNameAndQuantitySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          'Nike Shope 2024 lates model - New Year special deal',
          style: Theme.of(context).textTheme.titleMedium,
        )),
        ItemCount(
          initialValue: 1,
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
    );
  }

  Widget _buildRatingAndReviewSection() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(
              '{widget.product.star}',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.to(() => ReviewsScreen());
          },
          child: const Text('Reviews',
              style: TextStyle(
                  color: AppColors.themeColor, fontWeight: FontWeight.w500)),
        ),
        SizedBox(width: 5),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
    );
  }

  Widget buildPriceAndAddToCartSection() {
    return Container(
      //height: 100,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '1000\$',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
              width: 140,
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Add to Cart'))),
        ],
      ),
    );
  }
}

void backToHome() {
  return Get.find<BottomNavBarController>().backToHome();
}
