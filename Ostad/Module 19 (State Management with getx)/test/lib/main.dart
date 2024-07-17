import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/counter_app.dart';

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
        GetPage(name: '/', page: () => CounterApp()),
      ],
    );
  }
}
