import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePrac(),
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
