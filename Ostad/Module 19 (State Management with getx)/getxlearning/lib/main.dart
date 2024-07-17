import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearning/counter_app.dart';
import 'package:getxlearning/home_screen.dart';
import 'package:getxlearning/screen2.dart';

void main() {
  runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: HomeScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/second', page: () => Screen2()),
        GetPage(name: '/CounterApp', page: () => CounterApp()),
      ],
    );
  }
}
