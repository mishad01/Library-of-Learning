import 'package:crafty_bay/data/model/review_model.dart';
import 'package:crafty_bay/presentation/state_holders/review_profile_controller.dart';
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
    // Fetch the reviews and let the GetBuilder update the UI when data is available
    Get.find<ReviewProfileController>().getReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBarWidget('Reviews'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ReviewProfileController>(
          builder: (reviewProfileController) {
            // Show loading spinner while reviews are being fetched
            if (reviewProfileController.inProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show error message if any
            if (reviewProfileController.errorMessage != null) {
              return Center(
                child: Text(
                  reviewProfileController.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // Show message if no reviews are available
            if (reviewProfileController.reviewList.isEmpty) {
              return const Center(child: Text('No reviews available.'));
            }

            // Display the list of reviews
            return ListView.builder(
              itemCount: reviewProfileController.reviewList.length,
              itemBuilder: (context, index) {
                return reviewCard(reviewProfileController.reviewList[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget reviewCard(ReviewModel review) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
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
