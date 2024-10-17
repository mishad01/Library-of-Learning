import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/delete_cart_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart/cart_item_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late TextTheme textTheme = Theme.of(context).textTheme;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CartListController>().getNewProducts();
    Get.find<DeleteCartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Get.find<CartListController>().getNewProducts();
        },
        child: Column(
          children: [
            Expanded(
              child:
                  GetBuilder<CartListController>(builder: (cartListController) {
                return Visibility(
                  visible: !cartListController.inProgress,
                  replacement: CenteredCircularProgressIndicator(),
                  child: cartListController.cartList.isEmpty
                      ? Center(
                          child: Text(
                            'NOTHING ADDED TO CART YET',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                          itemCount: cartListController.cartList.length,
                          itemBuilder: (context, index) {
                            return CartItemWidget(
                                cartModel: cartListController.cartList[index]);
                          },
                        ),
                );
              }),
            ),
            buildPriceAndAddToCartSection(),
          ],
        ),
      ),
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
              Text('Total Price'),
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
                  ElevatedButton(onPressed: () {}, child: Text('Check Out'))),
        ],
      ),
    );
  }
}
