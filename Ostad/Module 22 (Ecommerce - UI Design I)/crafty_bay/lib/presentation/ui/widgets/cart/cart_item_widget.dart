import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
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
              Text('Title of product', style: textTheme.titleLarge),
              Wrap(
                spacing: 8,
                children: [
                  Text('Color : Red,', style: textTheme.bodyLarge),
                  Text('Color : XL', style: textTheme.bodyLarge)
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
          '\$100',
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
      child: Image.asset(
        AssetsPath.shoeImage,
        height: 100,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
