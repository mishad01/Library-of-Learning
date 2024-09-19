import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late TextTheme textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CartItemWidget();
              },
            ),
          ),
          buildPriceAndAddToCartSection(),
        ],
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
