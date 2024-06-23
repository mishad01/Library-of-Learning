import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/login_model.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screen/auth/email_verification_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manager/ui/screen/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';
import 'package:task_manager/ui/utility/app_constants.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _signInApiProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 160,
                  ),
                  //Image.asset(AssetPaths.appLogoSvg),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    controller: _emailTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      if (AppConstants.emailRegex.hasMatch(value!) == false) {
                        return 'Enter a valid  email Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your password';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Visibility(
                    visible: _signInApiProgress == false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        onTapNextButton();
                      },
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmailVerificationScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password',
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(color: AppColor.themeColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _onTapSignUpButton();
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
        ),
      )),
    );
  }

  void onTapNextButton() {
    if (_formState.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    _signInApiProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestData = {
      'email': _emailTEController.text.trim(),
      'password': _passwordTEController.text,
    };
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.login, body: requestData);

    _signInApiProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainBottomNavScreen(),
        ),
      );
    } else {
      showSnackBarMessahe(
        context,
        response.errorMessage ?? 'Email/Password is not Correct. Try again',
      );
    }
  }

  void _onTapSignUpButton() {
    if (_formState.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
