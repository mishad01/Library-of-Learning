import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 100,
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                "Hello World I am Mishad",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
