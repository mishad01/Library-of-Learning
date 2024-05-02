import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile Picture',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              CircleAvatar(
                radius: 80.0,
                backgroundImage:
                    AssetImage('images/naruto.jpeg'), // Replace with your image
              ),
              SizedBox(height: 20.0),
              Text(
                'Username: YourUsername',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Email: example@example.com',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
