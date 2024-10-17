import 'package:crafty_bay/data/model/cart_model.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Colors.white,
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                _buildProductDetailsAndDetails(textTheme),
                SizedBox(height: 10),
                _buildPriceAndCounter(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildProductDetailsAndDetails(TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartModel.product?.title ?? 'No title',
                  style: textTheme.titleLarge),
              Wrap(
                spacing: 8,
                children: [
                  Text('Color : ${cartModel.color}',
                      style: textTheme.bodyLarge),
                  Text('Color : ${cartModel.size}', style: textTheme.bodyLarge)
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
      ],
    );
  }

  Row _buildPriceAndCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cartModel.price.toString(),
          style: TextStyle(
              color: AppColors.themeColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          onChanged: (value) {},
          decimalPlaces: 0,
          color: AppColors.themeColor,
        )
      ],
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        cartModel.product?.image ?? " ",
        height: 100,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
