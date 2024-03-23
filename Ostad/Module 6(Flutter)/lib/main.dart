/* 1. Material App | Scaffold | Text | Center | Image | Icon
   2. Scaffold | Column | Row | Dialog | Bottom Sheet
 */
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColumnPrac(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          'Hello World. Practicing Flutter..to learn sharp my basic more',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.purple,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}

class IconPrac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.android,
          size: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}

class ImagePrac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/boy.jpg'),
      ),
    );
  }
}

//Column = Vertical

class ColumnPrac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Home Screen',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.home_filled),
          actions: [
            IconButton(
                onPressed: () {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('Money Has been transfered'),
                  //     backgroundColor: Colors.green,
                  //     duration: Duration(seconds: 1),
                  //   ),
                  // );
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Hello World'),
                        content: Text('I hope all good'),
                      );
                    },
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        backgroundColor: Colors.orange.withOpacity(0.9),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello World',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Hello World.........',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Hello World',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Grettting from ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Ovi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(' - ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('12-12-12',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
