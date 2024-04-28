import 'package:assignment_two/model/categories.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orange.withOpacity(0.55),
            Color.fromARGB(255, 26, 131, 52).withOpacity(0.9)
          ],
        ),
      ),
      child: Text(
        category.title,
        style: TextStyle(),
      ),
    );
  }
}
