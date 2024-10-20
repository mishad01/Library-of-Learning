import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/invoice_creation_screen.dart';
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

  int _totalPrice = 0; // Corrected to store total price at the class level

  @override
  void initState() {
    super.initState();
    Get.find<CartListController>().getNewProducts();
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
                              cartModel: cartListController.cartList[index],
                              onValueChanged: (totalPrice) {
                                setState(() {
                                  _totalPrice =
                                      totalPrice; // Update total price
                                });
                              },
                            );
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

  // Removed the old totalPrice method, and now just tracking _totalPrice

  Widget buildPriceAndAddToCartSection() {
    return Container(
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
                '\$$_totalPrice', // Corrected string interpolation for total price
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => InvoiceCreationScreen());
                  },
                  child: Text('Check Out'))),
        ],
      ),
    );
  }
}
