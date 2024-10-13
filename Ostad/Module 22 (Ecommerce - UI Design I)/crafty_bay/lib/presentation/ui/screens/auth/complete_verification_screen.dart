import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteVerificationScreen extends StatefulWidget {
  const CompleteVerificationScreen({super.key, required this.token});
  final String token;

  @override
  State<CompleteVerificationScreen> createState() =>
      _CompleteVerificationScreenState();
}

class _CompleteVerificationScreenState
    extends State<CompleteVerificationScreen> {
  @override
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingTEController = TextEditingController();
  final TextEditingController _postCodeTEController = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CreateProfileController createProfileController =
      Get.find<CreateProfileController>();

  String? test = AuthController.accessToken;

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
              Text(widget.token ?? "null"),
              const SizedBox(height: 8),
              Text(
                'Get Started with us with your details',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Column(
                key: _formKey,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _firstNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _cityTEController,
                    decoration: const InputDecoration(
                      hintText: 'City',
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _postCodeTEController,
                    decoration: const InputDecoration(
                      hintText: 'Post Code',
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    maxLines: 4,
                    controller: _shippingTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                      //contentPadding: EdgeInsets.symmetric(horizontal: 50),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GetBuilder<CreateProfileController>(
                  builder: (createProfileController) {
                return Visibility(
                  visible: !createProfileController.inProgress,
                  replacement: CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: _createProfile,
                    child: Text(
                      'Complete',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createProfile() async {
    bool result = await createProfileController.createProfile(
        _firstNameTEController.text.trim(),
        _lastNameTEController.text.trim(),
        _mobileTEController.text.trim(),
        _cityTEController.text.trim(),
        _shippingTEController.text.trim(),
        _postCodeTEController.text.trim(),
        widget.token);
    if (result == true) {
      Get.snackbar('Success', 'Profile Created successfully!');
      Get.off(() => EmailVerificationScreen());
    } else {
      Get.snackbar(
          'Error',
          createProfileController.errorMessage ??
              "An unexpected error occurred");
    }
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
    _postCodeTEController.dispose();
  }
}
