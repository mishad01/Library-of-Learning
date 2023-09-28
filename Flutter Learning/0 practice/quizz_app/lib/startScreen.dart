import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  startScreen(this.tap, {super.key});

  void Function() tap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/test.png',
          width: 110,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Quizz App",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: tap,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          label: Text('Start Quizz'),
          icon: Icon(Icons.arrow_right_alt),
        ),
      ],
    );
  }
}
