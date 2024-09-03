import 'package:crafty_bay/presentation/ui/controller/time_count_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreens extends StatefulWidget {
  const OtpVerificationScreens({super.key});

  @override
  State<OtpVerificationScreens> createState() => _OtpVerificationScreensState();
}

class _OtpVerificationScreensState extends State<OtpVerificationScreens> {
  final TextEditingController _otpTEController = TextEditingController();
  final TimeCountController _timeCountController =
      Get.find<TimeCountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const AppLogoWidget(),
            const SizedBox(height: 25),
            Text('Enter OTP Code',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text(
              'A 4 digit OTP Code has been Sent',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            PinCodeTextField(
              length: 6,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: AppColors.themeColor,
                inactiveFillColor: Colors.white,
                inactiveColor: AppColors.themeColor,
              ),

              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              //errorAnimationController: errorController,
              controller: _otpTEController,
              appContext: context,
            ),
            ElevatedButton(onPressed: _onTapNextButton, child: Text('Next')),
            const SizedBox(height: 16),
            richText(context),
            TextButton(onPressed: () {}, child: Text('Resend Code'))
          ],
        ),
      ),
    ));
  }

  Widget richText(BuildContext context) {
    return Obx(
      () {
        final remainingTime = _timeCountController.count;
        return RichText(
          text: TextSpan(
            text: 'This code will expire in ',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.grey),
            children: [
              TextSpan(
                  text: '${remainingTime}s',
                  style: TextStyle(color: AppColors.themeColor))
            ],
          ),
        );
      },
    );
  }

  void _onTapNextButton() {
    Get.to(() => const CompleteVerificationScreen());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpTEController.dispose();
  }
}
