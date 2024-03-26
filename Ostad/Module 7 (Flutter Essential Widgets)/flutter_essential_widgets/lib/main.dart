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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  //To change the color of text we use foreground color
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(width: 1.5, color: Colors.green),
                  ),
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  //padding: EdgeInsets.all(24),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                onPressed: () {},
                child: Text('Press Here')),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                    textStyle: TextStyle(fontSize: 24)),
                onPressed: () {},
                child: Text('Text Button')),
            IconButton(
                onPressed: () {
                  print('Tapped Icon Button');
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.deepOrangeAccent,
                )),
            /*    GestureDetector(
              onTap: () {
                print('Object');
              },
              onDoubleTap: () {
                print('On Double Tap detected');
              },
              onLongPress: () {
                print('On Long press');
              },
              child: Column(
                children: [
                  Text('Hello World'),
                  Icon(Icons.add_circle),
                  Row(
                    children: [
                      Text('This is a row'),
                    ],
                  )
                ],
              ),
            ),*/
            InkWell(
              splashColor: Colors.orange,
              radius: 16,
              onTap: () {
                print('Object');
              },
              onDoubleTap: () {
                print('On Double Tap detected');
              },
              onLongPress: () {
                print('On Long press');
              },
              child: Column(
                children: [
                  Text('Hello World'),
                  Icon(Icons.add_circle),
                  Row(
                    children: [
                      Text('This is a row'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //enabled: true,
                //controller: TextEditingController,
                style: TextStyle(fontSize: 20, color: Colors.green),
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: 'Enter your mail',
                  hintStyle: TextStyle(fontSize: 24),
                  label: Text('Email'),
                  //labelStyle:
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.orange),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.orange),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.orange),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  //If wanna see something at start of textfield
                  prefixIcon: Icon(Icons.add),
                  //If wanna see something at the end of textfield
                  suffixIcon: Icon(Icons.remove_red_eye),

                  prefix: Column(
                    children: [
                      Text('+'),
                      Text('+'),
                    ],
                  ),
                ),
              ),
            ),*/
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
                // border: Border(
                //   top: BorderSide(width: 3, color: Colors.black),
                //   bottom: BorderSide(width: 3, color: Colors.black),
                // ),
                image: DecorationImage(
                  image: AssetImage("assetName"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
