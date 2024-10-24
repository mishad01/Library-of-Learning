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
              decoration: InputDecoration(hintText: 'First Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 8,
              decoration: InputDecoration(hintText: 'Write Review'),
            ),
            const SizedBox(height: 10),
            GetBuilder<CreateProductReviewController>(
                builder: (createProductReviewController) {
              return Visibility(
                  visible: (!createProductReviewController.inProgress),
                  replacement: CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                      onPressed: () {
                        createProductReviewController.addReview(
                            _descriptionTEController.toString(),
                            widget.productId,
                            _ratingEController.toString());
                      },
                      child: Text('Submit')));
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTEController.dispose();
    _ratingEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
