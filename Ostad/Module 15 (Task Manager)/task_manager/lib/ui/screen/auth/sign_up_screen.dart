import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';
import 'package:task_manager/ui/utility/app_constants.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _registrationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: _firstNameTEController,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _lastNameTEController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _mobileTEController,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Mobile Number';
                      }
                      if (AppConstants.mobileRegex.hasMatch(value!) == false) {
                        return 'Enter a valid phone number';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: _showPassword == false,
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              _showPassword = !_showPassword;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            icon: Icon(_showPassword
                                ? Icons.remove_red_eye
                                : Icons.visibility_off))),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your password';
                      }
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _registerUser();
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
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
        ),
      )),
    );
  }

  void _registerUser() async {
    _registrationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": ""
    };

    NetworkResponse response = await NetworkCaller.postRequest(
        Urls.registrationUrl,
        body: requestInput);
    if (response.isSuccess) {
      _clearTextField();
      if (mounted) {
        showSnackBarMessahe(context, 'Registration Success');
      }
    } else {
      if (mounted) {
        showSnackBarMessahe(
            context, response.errorMessage ?? 'Registration failed, try again');
      }
    }
  }

  void _clearTextField() {
    _emailTEController.clear();
    _passwordTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
  }
}
