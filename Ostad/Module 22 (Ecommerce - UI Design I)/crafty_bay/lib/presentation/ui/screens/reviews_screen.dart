import 'package:crafty_bay/data/model/review_model.dart';
import 'package:crafty_bay/presentation/state_holders/review_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});
  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ReviewProfileController>().getReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBarWidget('Reviews'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            GetBuilder<ReviewProfileController>(
              builder: (reviewProfileController) {
                if (reviewProfileController.inProgress) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (reviewProfileController.errorMessage != null) {
                  return Center(
                    child: Text(
                      reviewProfileController.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (reviewProfileController.reviewList.isEmpty) {
                  return const Center(child: Text('No reviews available.'));
                }

                return ListView.builder(
                  itemCount: reviewProfileController.reviewList.length,
                  itemBuilder: (context, index) {
                    return reviewCard(
                        reviewProfileController.reviewList[index]);
                  },
                );
              },
            ),
            buildAddReview(),
          ],
        ),
      ),
    );
  }

  Widget buildAddReview() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 1,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ADD REVIEW',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Get.to(() => CreateReviewScreen(
                        productId: widget.productId,
                      ));
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  Widget reviewCard(ReviewModel review) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1.5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.person,
            color: Colors.grey.shade600,
          ),
        ),
        title: Text(
          review.profile?.cusName ?? 'Anonymous',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        subtitle: Text(
          review.description ?? 'No description provided.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
