import 'package:flutter/material.dart';
import 'package:quizz_app/answerButton.dart';
import 'package:quizz_app/data/questions.dart';

class questionScreen extends StatefulWidget {
  questionScreen({super.key, required this.onSelectedAnswer});
  void Function(String text) onSelectedAnswer;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _quizzQuestion();
  }
}

class _quizzQuestion extends State<questionScreen> {
  List<String> selectedAnswer = [];
  var currentQuestionIndex = 0;

  void nextQuestion(String text) {
    widget.onSelectedAnswer(text);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = Question[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.qestionsQuizz,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          ...currentQuestion.answerOption.map((e) {
            return answerButton(
              text: e,
              onTap: () {
                nextQuestion(e);
              },
            );
          })
        ],
      ),
    );
  }
}
