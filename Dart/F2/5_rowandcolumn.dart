import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Container(
          color: Colors.yellow,
          height: 300,
          width: 300,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("A", style: TextStyle(fontSize: 25)),
                Text("B", style: TextStyle(fontSize: 25)),
                Text("C", style: TextStyle(fontSize: 25)),
                Text("D", style: TextStyle(fontSize: 25)),
                Text("E", style: TextStyle(fontSize: 25)),
                ElevatedButton(onPressed: () {}, child: Text("Check"))
              ]),
        ),
      ),
    ),
  );
}
