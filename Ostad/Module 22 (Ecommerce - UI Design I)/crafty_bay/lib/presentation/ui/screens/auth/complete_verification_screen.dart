import 'package:crafty_bay/presentation/ui/screens/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';

class CompleteVerificationScreen extends StatefulWidget {
  const CompleteVerificationScreen({super.key});

  @override
  State<CompleteVerificationScreen> createState() =>
      _CompleteVerificationScreenState();
}

class _CompleteVerificationScreenState
    extends State<CompleteVerificationScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              SizedBox(height: 120, width: 120, child: AppLogoWidget()),
              const SizedBox(height: 15),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Get Started with us with your details',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _firstNameTEController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _mobileTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Mobile',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _cityTEController,
                decoration: const InputDecoration(
                  hintText: 'City',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 4,
                controller: _shippingTEController,
                decoration: const InputDecoration(
                  hintText: 'Shipping Address',
                  //contentPadding: EdgeInsets.symmetric(horizontal: 50),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Complete',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingTEController.dispose();
  }
}
