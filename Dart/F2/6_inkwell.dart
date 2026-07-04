/*• InkWell is the material widget in flutter.
• It responds to the touch action as performed by the user.
• Inkwell will respond when the user clicks it/
Tap on it.
• There are so many gestures like double-tap,
long press, tap down, etc.*/
//Mainly if wanna click on image or anything like this
//Or we wanna click on image,icon,widget or anything like that we will use Inkwell
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter App"),
          ),
          body: Center(
            child: InkWell(
              // onTap: () {
              //   print("Ontap Pressed");
              // },
              onLongPress: () {
                print("On Long press");
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
              ),
            ),
          )),
    ),
  );
}
