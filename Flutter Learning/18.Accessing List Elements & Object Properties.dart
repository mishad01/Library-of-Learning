import 'package:flutter/material.dart';
import 'package:quizz_app_practice/answer_button.dart';
import 'package:quizz_app_practice/data/Questions.dart'

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});
  @override
  State<questionScreen> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  final currentQuestion =
      questions[0]; //We have to acces the quistion using this
  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text, //This for question
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          answerButton(answerText: currentQuestion.answers[0], onTap: () {}),
          const SizedBox(height: 10),
          answerButton(answerText: currentQuestion.answers[1], onTap: () {}),
          const SizedBox(height: 10),
          answerButton(answerText: currentQuestion.answers[2], onTap: () {}),
          const SizedBox(height: 10),
          answerButton(answerText: currentQuestion.answers[3], onTap: () {}),
        ],
      ),
    );
  }
}
