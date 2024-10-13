import 'package:crafty_bay/controller_binder.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: _ThemeData(),
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/mainBottomNavBar', page: () => MainBottomNavbarScreen()),
        GetPage(
          name: '/allCategories',
          page: () => CategoryScreen(),
        )
      ],
    );
  }

  ThemeData _ThemeData() {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      //scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.themeColor),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        errorBorder: _outlineInputBorder(Colors.red),
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: TextStyle(fontSize: 16),
          fixedSize: Size.fromWidth(double.maxFinite),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.themeColor,
              textStyle: TextStyle(fontSize: 16))),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
        borderSide:
            BorderSide(color: color ?? AppColors.themeColor, width: 1.4),
        borderRadius: BorderRadius.circular(8));
  }
}
