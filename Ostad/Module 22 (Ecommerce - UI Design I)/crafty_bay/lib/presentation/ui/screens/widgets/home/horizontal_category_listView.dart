import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryListView extends StatelessWidget {
  const HorizontalCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              //height: 130,
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.computer,
                  size: 48, color: AppColors.themeColor),
            ),
            const SizedBox(height: 4),
            const Text('Electronics',
                style: TextStyle(color: AppColors.themeColor)),
          ],
        );
      },
    );
  }
}
