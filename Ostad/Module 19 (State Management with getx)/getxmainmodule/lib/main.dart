import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmainmodule/count_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CountApp(),
      initialBinding: ControllerBinding(),
    );
  }
}

class ControllerBinding extends Bindings {
  void dependencies() {
    Get.put(CounterController());
  }
}

class CountApp extends StatefulWidget {
  const CountApp({super.key});

  @override
  State<CountApp> createState() => _CountAppState();
}

class _CountAppState extends State<CountApp> {
  final CounterController _counterController = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(
            //   () => Text('Counter Value : ${_counterController.count}'),
            // ),
            GetBuilder<CounterController>(
              builder: (controller) {
                return Text('Counter Value : ${_counterController.count}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counterController.increment();
          },
          child: Icon(Icons.add)),
    );
  }
}
