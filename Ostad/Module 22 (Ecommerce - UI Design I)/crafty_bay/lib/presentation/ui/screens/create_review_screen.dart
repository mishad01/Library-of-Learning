import 'package:crafty_bay/presentation/state_holders/create_product_review_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_app_bar_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});
  final int productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  TextEditingController _nameTEController = TextEditingController();
  TextEditingController _ratingEController = TextEditingController();
  TextEditingController _descriptionTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBarWidget('Create Review'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameTEController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ratingEController,
              keyboardType: TextInputType
                  .number, // Ensure the keyboard allows number input
              decoration: InputDecoration(hintText: 'Rating Out of 5'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descriptionTEController,
              maxLines: 8,
              decoration:
                  InputDecoration(hintText: 'Description'), // Corrected typo
            ),
            const SizedBox(height: 10),
            GetBuilder<CreateProductReviewController>(
                builder: (createProductReviewController) {
              return Visibility(
                visible: !createProductReviewController.inProgress,
                replacement: CenteredCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () async {
                    String description = _descriptionTEController.text;
                    int rating = int.tryParse(_ratingEController.text) ??
                        0; // Ensure rating is an integer

                    if (rating < 1 || rating > 5) {
                      // Handle invalid rating input
                      Get.snackbar('Invalid Rating',
                          'Please provide a rating between 1 and 5');
                      return;
                    }

                    bool success = await createProductReviewController
                        .addReview(description, widget.productId, rating);

                    if (success) {
                      Get.back();
                    } else {
                      Get.snackbar(
                          'Error',
                          createProductReviewController.errorMessage ??
                              'Failed to submit review');
                    }
                  },
                  child: Text('Submit'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _ratingEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
