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
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Text 1",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Text 2",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Text 3",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Text 4",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Text 5",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
          ),
        ]),
      ),
    );
  }
}
