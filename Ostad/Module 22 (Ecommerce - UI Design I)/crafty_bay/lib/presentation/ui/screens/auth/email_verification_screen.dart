import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/otp_verification_screens.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/snac_message.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formState,
            child: Column(
              children: [
                const SizedBox(height: 80),
                AppLogoWidget(),
                const SizedBox(height: 25),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                GetBuilder<EmailVerificationController>(
                    builder: (emailVerificationController) {
                  return Visibility(
                    visible: !emailVerificationController.inProgress,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        onTapNextButton();
                      },
                      child: Text(
                        'Next',
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
      ),
    );
  }

  void onTapNextButton() async {
    if (!_formState.currentState!.validate()) {
      return;
    }
    bool result = await _emailVerificationController
        .verifyEmail(_emailTEController.text.trim());
    if (result) {
      Get.to(() => OtpVerificationScreen(
            email: _emailTEController.text,
          ));
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          _emailVerificationController.errorMessage!,
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
