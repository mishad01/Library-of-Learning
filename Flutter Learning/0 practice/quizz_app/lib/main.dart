import 'package:flutter/material.dart';
import 'package:quizz_app/startScreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 100, 26, 228),
                  Color.fromARGB(255, 81, 25, 177)
                ],
              ),
            ),
            child: Center(
              child: startScreen(),
            )),
      ),
    ),
  );
}
