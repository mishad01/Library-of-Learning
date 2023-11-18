/*3 Types of Button
1. Text Button(Flat Button)
2. Elevated Button(Raised Button)
3. Outlined Button*/
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print("On pressed");
                },
                onLongPress: () {
                  print("Long pressed");
                },
                child: Text("Text Button"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print("On pressed");
                },
                onLongPress: () {
                  print("Long pressed");
                },
                child: Text("Text Button"),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  print("On pressed");
                },
                onLongPress: () {
                  print("Long pressed");
                },
                child: Text("Text Button"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
