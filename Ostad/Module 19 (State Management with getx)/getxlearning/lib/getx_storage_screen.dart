import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetXStorageScreen extends StatelessWidget {
  const GetXStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  GetStorage().write('Name', "Mishad");
                },
                child: Text('Write Data')),
            ElevatedButton(
                onPressed: () {
                  var MyName = GetStorage().read('Name');
                  Get.snackbar(MyName, "This is my name");
                },
                child: Text('Read Data')),
            ElevatedButton(
                onPressed: () {
                  GetStorage().remove("Name");
                },
                child: Text('Erase Data')),
          ],
        ),
      ),
    );
  }
}
