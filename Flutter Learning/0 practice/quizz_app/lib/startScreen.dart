import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/test.png',
          width: 110,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Quizz App",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          label: Text('Start Quizz'),
          icon: Icon(Icons.arrow_right_alt),
        ),
      ],
    );
  }
}
