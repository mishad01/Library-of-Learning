import 'package:crafty_bay/data/model/cart_model.dart';
import 'package:crafty_bay/presentation/state_holders/delete_cart_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.cartModel,
    required this.onValueChanged,
  });
  final CartModel cartModel;
  final Function(int totalPrice) onValueChanged;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity = int.parse(widget.cartModel.qty ?? "0");
  }

  int totalPrice = 0;
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
              Text(
                widget.cartModel.product?.title ?? 'No title',
                overflow: TextOverflow.ellipsis,
                style: textTheme.labelLarge!.copyWith(color: Colors.black54),
              ),
              Wrap(
                spacing: 8,
                children: [
                  Text('Color : ${widget.cartModel.color}',
                      style: textTheme.bodyLarge),
                  Text('Size : ${widget.cartModel.size}',
                      style: textTheme.bodyLarge),
                ],
              ),
              Text('Item: ${widget.cartModel.qty}', style: textTheme.bodyLarge)
            ],
          ),
        ),
        GetBuilder<DeleteCartController>(builder: (deleteCartController) {
          return Visibility(
            visible: !deleteCartController.inProgress,
            replacement: CenteredCircularProgressIndicator(),
            child: IconButton(
              onPressed: () {
                deleteCartController
                    .deleteCart(widget.cartModel.productId.toString());
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        })
      ],
    );
  }

  Row _buildPriceAndCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.cartModel.price.toString(),
          style: TextStyle(
              color: AppColors.themeColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        ItemCount(
          initialValue: quantity,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {
            setState(() {
              quantity = value.toInt();
              totalPrice = int.parse(widget.cartModel.price ?? "0") *
                  quantity; // Correct calculation
              int xz = int.parse(widget.cartModel.price ?? "0");
              print(".......................$quantity");
              print(".........................$xz");
            });
            widget.onValueChanged(totalPrice);
          },
        )
      ],
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                widget.cartModel.product?.image ?? " ",
              ),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        height: 90,
        width: 90,
      ),
    );
  }
}
