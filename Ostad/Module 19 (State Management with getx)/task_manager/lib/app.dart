import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller_binder.dart';
import 'package:task_manager/ui/screens/auth/email_verification_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager/ui/screens/auth/splash_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const SplashScreen(),
      theme: _lightThemeData(),
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/signIn', page: () => SignInScreen()),
        GetPage(name: '/signUp', page: () => SignUpScreen()),
        GetPage(name: '/ForgotPassword', page: () => EmailVerificationScreen()),
        GetPage(name: '/Logout', page: () => SignInScreen()),
      ],
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(color: Colors.grey)),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        fillColor: AppColors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: AppColors.white,
          fixedSize: Size.fromWidth(double.maxFinite),
          //fixedSize: Size.fromWidth(double.infinity),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
