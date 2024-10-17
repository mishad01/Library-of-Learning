import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/data/model/wish_list_model.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  WishListController wishListController = Get.find<WishListController>();

  @override
  void initState() {
    super.initState();
    wishListController.getProductWishList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wish List'),
          leading: IconButton(
            onPressed: backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<WishListController>(builder: (wishListController) {
            return Visibility(
              visible: !wishListController.inProgress,
              replacement: CenteredCircularProgressIndicator(),
              child: GridView.builder(
                itemCount: wishListController.productWishList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.83,
                ),
                itemBuilder: (context, index) {
                  WishListModel wishListModel =
                      wishListController.productWishList[index];
                  ProductModel? product =
                      wishListModel.product; // Extract the product

                  // Check if the product is null
                  if (product != null) {
                    return Container(
                      child: product_card2(
                        product: product,
                      ),
                    );
                  } else {
                    // Optionally handle the null case (e.g., display a placeholder)
                    return Container(
                      child: Text('Product information is unavailable'),
                    );
                  }
                },
              ),
            );
          }),
        ),
      ),
    );
  }

  void backToHome() {
    return Get.find<BottomNavBarController>().backToHome();
  }
}
