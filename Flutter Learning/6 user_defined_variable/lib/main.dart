//import 'package:basic_first/Gradiant_container.dart';
import 'package:vi_user_defined_variable/Gradiant_container.dart';
import 'package:flutter/material.dart';

//Here we have to select path in pubspec.yaml file//Check asset there
//And also we have to create assets folder and inside that asset we have to create image folder then we have to store images there
//Basic Styling
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Colors.deepOrange,
          Colors.green,
        ),
      ),
    ),
  );
}
