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
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Text(arrnames[index],
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500));
            },
            itemCount: 5,
          )),
    );
  }
}
