import 'package:crafty_bay/data/model/product_details_model.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/reviews_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/snac_message.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.black,
    AppColors.themeColor,
    Colors.brown,
    Colors.blueAccent,
    Colors.grey
  ];

  String _selectedColor = 'aaa';

  String _selectedSize = '12';
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

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
        body: GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
          if (productDetailsController.inProgress) {
            return CenteredCircularProgressIndicator();
          }
          if (productDetailsController.errorMessage != null) {
            return Center(child: Text(productDetailsController.errorMessage!));
          }
          return Column(
            children: [
              Expanded(
                child:
                    buildProductDetails(productDetailsController.productModel!),
              ),
              buildPriceAndAddToCartSection(
                  productDetailsController.productModel!),
            ],
          );
        }),
      ),
    );
  }

  Widget buildProductDetails(ProductDetailsModel product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageSlider(
            sliderUrls: [
              product.img1!,
              product.img2!,
              product.img3!,
              product.img4!,
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNameAndQuantitySection(product),
                _buildRatingAndReviewSection(product),
                SizedBox(height: 8),
                ColorPicker(
                  colors: colors,
                  onSelectedColor: (color) {
                    _selectedColor = color.toString();
                  },
                ),
                SizedBox(height: 16),
                SizePicker(
                  sizes: product.size!.split(','),
                  onSelectedColor: (p0) {
                    _selectedSize = p0.toString();
                  },
                ),
                SizedBox(height: 16),
                Text('Description',
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  textAlign: TextAlign.justify,
                  product.des!,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNameAndQuantitySection(ProductDetailsModel productDetails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          productDetails.product?.title ?? " ",
          style: Theme.of(context).textTheme.titleMedium,
        )),
        ItemCount(
          initialValue: quantity,
          minValue: 0,
          maxValue: 10,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {
            // Handle counter value changes
            quantity = value.toInt();
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productDetailsModel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(
              '${productDetailsModel.product?.star ?? ""}',
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

  Widget buildPriceAndAddToCartSection(
      ProductDetailsModel productDetailsModel) {
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
                '\$${productDetailsModel.product?.price ?? " "}',
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
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: !addToCartController.inProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: _onTapAddToCart,
                  child: const Text('Add To Cart'),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Future<void> _onTapAddToCart() async {
    bool isLoggedInUser = Get.find<AuthController>().isLoggedInUser();
    if (isLoggedInUser) {
      AuthController.accessToken;
      final result = await Get.find<AddToCartController>().addToCart(
        widget.productId,
        _selectedColor,
        _selectedSize,
        quantity,
      );
      if (result) {
        if (mounted) {
          showSnackBarMessage(context, 'Added to cart');
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, Get.find<AddToCartController>().errorMessage!, true);
        }
      }
    } else {
      Get.to(() => const EmailVerificationScreen());
    }
  }
}
