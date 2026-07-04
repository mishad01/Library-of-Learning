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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: Colors.lightGreen,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 00,
                        color: const Color.fromARGB(255, 74, 195, 195),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: Colors.green,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: Colors.orange,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: Colors.lightGreen,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: const Color.fromARGB(255, 74, 195, 195),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: Colors.green,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 100,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: Colors.lightGreen,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: const Color.fromARGB(255, 74, 195, 195),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: Colors.lightGreen,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: const Color.fromARGB(255, 74, 195, 195),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
