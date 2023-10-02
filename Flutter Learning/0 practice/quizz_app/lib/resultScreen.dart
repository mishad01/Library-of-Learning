import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final totalquestion = Question.length
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'From $totalquestion Question Total Right Answer Y',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
