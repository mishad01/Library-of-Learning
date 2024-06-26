import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/auth/splash_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: _lightThemeData(),
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            letterSpacing: 0.4),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.themeColor,
          padding: EdgeInsets.symmetric(vertical: 12),
          foregroundColor: AppColor.white,
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
