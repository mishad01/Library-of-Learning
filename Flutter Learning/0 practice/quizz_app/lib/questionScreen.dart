import 'package:flutter/material.dart';
import 'package:quizz_app/answerButton.dart';

class questionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _quizzQuestion();
  }
}

class _quizzQuestion extends State<questionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question Screen',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          answerButton('Op 1'),
        ],
      ),
    );
  }
}
