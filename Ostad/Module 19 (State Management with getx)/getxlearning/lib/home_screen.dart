import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearning/screen2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Getx Practice', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //GetX SnackBar
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Hi",
                  "Hello Getx",
                  snackPosition: SnackPosition.BOTTOM,
                  showProgressIndicator: true,
                  backgroundColor: Colors.green,
                  colorText: Colors.black,
                  borderRadius: 2,
                  margin: EdgeInsets.all(10),
                  //padding: EdgeInsets.all(5),
                  icon: Icon(Icons.add_circle_outline, color: Colors.white),
                  isDismissible: false,
                  duration: Duration(seconds: 2),
                  animationDuration: Duration(milliseconds: 1500),
                );
              },
              child: Text('Click Snackbar'),
            ),
            //GetX Dialog
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Delete Alert",
                      titlePadding: EdgeInsets.all(10),
                      titleStyle: TextStyle(color: Colors.black),
                      middleText: "Once delete, you can't get it back",
                      middleTextStyle: TextStyle(color: Colors.white),
                      backgroundColor: Colors.blue,
                      //radius: 2,
                      textConfirm: "Confirm",
                      confirmTextColor: Colors.white,
                      textCancel: "Not now",
                      cancelTextColor: Colors.white,
                      onCancel: () {
                        Get.back(closeOverlays: true);
                      },
                      content: Column(
                        children: [Text('1'), Text('2'), Text('3')],
                      ));
                },
                child: Text('Click Default Dialog')),
            //Get Bottom Sheet
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Text('A'),
                          Text('A'),
                          Text('A'),
                          Text('A'),
                        ],
                      ),
                    ),
                    //enableDrag: false,
                    //isDismissible: false,
                  );
                },
                child: Text('Click Bottom Sheet')),

            //GetX Routing

            //Get.to == Navigator.push [Goes to a new Screen)
            ElevatedButton(
              onPressed: () {
                Get.to(Screen2());
              },
              child: Text('Go to next screen'),
            ),

            //Get.off == Replaces current page with new one
            ElevatedButton(
              onPressed: () {
                Get.off(Screen2());
              },
              child: Text('Go to next screen Getx Off'),
            ),

            //Get.offAll == remove all previous screens
            ElevatedButton(
              onPressed: () {
                Get.offAll(Screen2());
              },
              child: Text('Go to next screen Getx Off'),
            ),

            //Get.toNamed
            ElevatedButton(
              onPressed: () {
                Get.offNamed("/second");
              },
              child: Text('Go to next screen'),
            ),
            //Counter App
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/CounterApp');
              },
              child: Text('Counter App'),
            ),
          ],
        ),
      ),
    );
  }
}
