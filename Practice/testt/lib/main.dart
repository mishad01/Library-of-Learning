import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: const Color.fromRGBO(255, 235, 59, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1"),
                  Text("10"),
                  Text("100"),
                  Text("1000"),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
