import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screen/auth/set_password_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

//import './constants/constants.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _pinTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'PIN Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'A 6 digit verification pin will be send to your email address',
                  //style: TextStyle(color: Colors.grey),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildPinCodeTextField(),
                const SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   controller: _passwordTEController,
                //   decoration: InputDecoration(hintText: 'Password'),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text('Verify'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     'Forgot Password',
                      //   ),
                      // ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4),
                          text: "Have account? ",
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(color: AppColor.themeColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _onTapSignInButton();
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //This RichText widget in Flutter is used to display a piece of text with multiple styles in a single text block.
              ],
            ),
          ),
        ),
      )),
    );
  }

  PinCodeTextField _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      //obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: AppColor.themeColor,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      //errorAnimationController: errorController,
      controller: _pinTEController,
      appContext: context,
      keyboardType: TextInputType.number,
    );
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    //_passwordTEController.dispose();
  }
}
