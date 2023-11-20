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
    var arrnames = ["Mishad", "Saif", "Ananya", "Oney", "Prachi"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter App"),
          ),
          body: Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.grey,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.yellow,
              ),
              Expanded(
                child: Container(
                  width: 50,
                  height: 100,
                  color: Colors.black54,
                ),
              )
            ],
          )),
    );
  }
}
