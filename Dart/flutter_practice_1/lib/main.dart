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
