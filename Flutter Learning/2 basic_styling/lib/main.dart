import 'package:flutter/material.dart';

//Basic Styling
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // We use this scaffold for styling
        //Now if we wanna give background color to this app,Below the code we have to write
        backgroundColor: Color.fromRGBO(221, 195, 117, 1),
        body: Center(
          //we got the center by right clicking on text and from refector and got center option
          //And we will see here that Hello World is in center with white background
          child: Text('Hello World'),
        ),
      ),
    ),
  );
}
