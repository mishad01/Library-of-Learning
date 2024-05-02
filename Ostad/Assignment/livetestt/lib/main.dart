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
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage(
                      'assets/images/naruto.jpeg'), // Replace with your image
                ),
                SizedBox(height: 20.0),
                Text(
                  'Matilda Brown',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'matildabrown@gmail.com',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Meet Matilda Brown, a dynamic software engineer with a passion for crafting innovative solutions in the digital realm. With a keen eye for detail and a knack for problem-solving, Matilda thrives in the fast-paced world of technology, where she merges creativity with technical expertise to bring ideas to life. Driven by a relentless curiosity and a love for learning, Matilda constantly seeks out new challenges and opportunities to expand his skills. ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
