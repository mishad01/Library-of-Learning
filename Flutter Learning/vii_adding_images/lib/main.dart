import 'package:flutter/material.dart';
//import 'package:user_variable_prac/textTest.dart';
import 'package:user_variable_prac/gradientContainer.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: gradientContainer(
          colors: const [Colors.blueGrey, Colors.brown],
        ),
      ),
    ),
  );
}
