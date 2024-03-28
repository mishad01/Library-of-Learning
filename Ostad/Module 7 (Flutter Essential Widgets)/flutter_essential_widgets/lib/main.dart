//Button(Elevated Button, Text Button, Icon Button, Gesture Detector,InkWell)
//Text Field ||Container ||Rich Text
// Gridview | Inkwell | GestureDetector
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
  List<String> StudentList = [
    'Sakif',
    'Rahman',
    'Mishad',
    'Sazin',
    'Rahman',
    'Mahi',
  ];
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
      /*body: Center(
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
        ),*/

      //Single Child Scroll View
      /*body: SingleChildScrollView(
        child: Column(
          children: [
            Text("1rrrrr"),
            Text('2'),
            Text('3rrrrrrr'),
            Text("1"),
            Text('2'),
            Text('3rrrrrr'),
            Text("1"),
            Text('2'),
            Text('3'),
            Text("rrrrrrrr1"),
            Text('2'),
            Text('3'),
            Text("1"),
            Text('2'),
            Text('3'),
            Text("1"),
            Text('2rrrrrrr'),
            Text('3'),
            Text("1"),
            Text('2'),
            Text('3'),
            Text("1rrrrrrrr"),
            Text('2'),
            Text('3'),
            Text("1"),
            Text('2'),
            Text('3'),
            Text("1"),
            Text('2'),
            Text('3'),
            Text("1"),
            Text('2'),
            Text('3rrrrr'),
            Text('3'),
            Text('3'),
            Text('rrrrrrr3'),
            Text('3'),
            Text('3'),
            Text('3rrrrr'),
            Text('3'),
            Text('3'),
            Text('rrrrrrr3'),
            Text('3'),
            Text('3'),
          ],
        ),
      ),*/

      //ListView
      /*body: ListView(
        //scrollDirection: Axis.vertical,
        scrollDirection: Axis.horizontal,
        children: [
          Text("1rrrrr"),
          Text('2'),
          Text('3rrrrrrr'),
          Text("1"),
          Text('2'),
          Text('3rrrrrr'),
          Text("1"),
          Text('2'),
          Text('3'),
          Text("rrrrrrrr1"),
          Text('2'),
          Text('3'),
          Text("1"),
          Text('2'),
          Text('3'),
          Text("1"),
          Text('2rrrrrrr'),
          Text('3'),
          Text("1"),
          Text('2'),
          Text('3'),
          Text("1rrrrrrrr"),
          Text('2'),
          Text('3'),
          Text("1"),
          Text('2'),
          Text('3'),
          Text("1"),
          Text('2'),
          Text('3'),
          Text("1"),
          Text('2'),
          Text('3rrrrr'),
          Text('3'),
          Text('3'),
          Text('rrrrrrr3'),
          Text('3'),
          Text('3'),
          Text('3rrrrr'),
          Text('3'),
          Text('3'),
          Text('rrrrrrr3'),
          Text('3'),
          Text('3'),
          Text('3'),
        ],
      ),*/

      /*body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text(
            '${index + 1}',
            style: TextStyle(fontSize: 30),
          );
        },
      ),
       */
      // body: ListView.builder(
      //   itemCount: StudentList.length,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         children: [
      //           Text(StudentList[index]),
      //           Divider(),
      //         ],
      //       ),
      //     );
      //   },
      // ),

      //ListView.separated
      /*body: ListView.separated(
        itemCount: StudentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StudentList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  StudentList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            //Divider(),
          );
        },
        separatorBuilder: (context, index) {
          //return Text('Test');
          return Divider(
            height: 6,
            thickness: 2,
            endIndent: 10, //For spacing at last
            indent: 32, //For spacing at begining
            color: Colors.black,
          );
        },
      ),*/

      //Grid View
      /*body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: [
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20)),
          Text('1', style: TextStyle(fontSize: 20))
        ],
      ),*/

      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false, //Scrolling capability will be lost
              itemCount: StudentList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(StudentList[index]),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 100,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                mainAxisSpacing: 10, // space between upto down
                crossAxisSpacing: 10, // space between sidewise
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text('Roll -${index + 1}'),
                    //Text(StudentList[index]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
