import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller_state.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterStateController C = Get.put(CounterStateController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter app',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(child: Obx(() => Text("Click: ${C.count}"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          C.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
