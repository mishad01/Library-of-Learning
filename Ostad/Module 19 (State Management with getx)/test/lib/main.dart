import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller_state.dart';
import 'package:test/counter_app.dart';

void main() {
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
      initialBinding: ControllerBinding(),
    );
  }
}

class ControllerBinding extends Bindings {
  void dependencies() {
    Get.put(CounterStateController());
  }
}
