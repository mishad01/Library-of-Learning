import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearning/getx_storage_screen.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Hello World'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(GetXStorageScreen());
            },
            child: Text('Go to previous'),
          )
        ],
      ),
    );
  }
}
