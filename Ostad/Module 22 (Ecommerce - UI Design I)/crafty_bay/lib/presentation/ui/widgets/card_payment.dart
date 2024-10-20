import 'package:crafty_bay/presentation/state_holders/invoice_creation_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPayment extends StatelessWidget {
  const CardPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceCreationController>(
        builder: (invoiceCreationController) {
      // Handle error message display
      if (invoiceCreationController.errorMessage != null &&
          invoiceCreationController.errorMessage!.isNotEmpty) {
        return Center(
          child: Text(
            invoiceCreationController.errorMessage!,
            style: TextStyle(color: Colors.red),
          ),
        );
      }

      return Visibility(
        visible: !invoiceCreationController.inProgress,
        replacement: CenteredCircularProgressIndicator(),
        child: Card(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjust columns based on design
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            itemCount: invoiceCreationController.cardPaymentMethod.length,
            itemBuilder: (context, index) {
              // Show actual content from the PaymentMethod
              final paymentMethod =
                  invoiceCreationController.cardPaymentMethod[index];
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.1,
                      child: Image.network(
                        paymentMethod.logo ?? "",
                        fit: BoxFit.contain,
                      ),
                    ) // Show payment method name
                    // You can display other details or icons here if needed
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
