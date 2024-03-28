//Button(Elevated Button, Text Button, Icon Button, Gesture Detector,InkWell)
//Text Field ||Container ||Rich Text
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.home_filled),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Text("data"),
    );
  }
}
