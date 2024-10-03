import 'package:crafty_bay/data/model/category_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>
            ProductListScreen(categoryName: categoryModel.categoryName ?? ' '));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(categoryModel.categoryImg ?? ""),
              ),
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            /*child: const Icon(Icons.computer,
                size: 48, color: AppColors.themeColor),*/
          ),
          const SizedBox(height: 4),
          Text(categoryModel.categoryName ?? ' ',
              style: TextStyle(color: AppColors.themeColor)),
        ],
      ),
    );
  }
}
