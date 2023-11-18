import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),

        // body: Center(
        //   child: Container(
        //     width: 300,
        //     height: 100,
        //     color: Colors.blueGrey,
        //     child: const Center(
        //       child: Text(
        //         "Hello World I am Mishad",
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
