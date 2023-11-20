import 'package:flutter/material.dart';

void main() {
  runApp(appp());
}

class appp extends StatefulWidget {
  @override
  State<appp> createState() {
    return _appp();
  }
}

class _appp extends State<appp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: 
      ),
    );
  }
}
