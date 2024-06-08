import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
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
                  'Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Minimum length password 8 characters with letter and number combination',
                  //style: TextStyle(color: Colors.grey),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Passowrd'),
                  controller: _passwordTEController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Confirm Passowrd'),
                  controller: _confirmPasswordTEController,
                ),
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
                  onPressed: () {},
                  child: Text('Confirm'),
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

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
  }
}
