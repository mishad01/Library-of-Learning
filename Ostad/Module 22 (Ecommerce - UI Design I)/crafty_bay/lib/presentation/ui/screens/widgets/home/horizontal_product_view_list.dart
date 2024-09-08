import 'package:crafty_bay/presentation/ui/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductCard();
      },
      separatorBuilder: (context, index) => SizedBox(width: 4),
    );
  }
}
