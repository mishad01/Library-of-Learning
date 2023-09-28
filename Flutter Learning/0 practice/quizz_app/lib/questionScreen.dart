import 'package:flutter/material.dart';
import 'package:quizz_app/answerButton.dart';
import 'package:quizz_app/data/questions.dart';

class questionScreen extends StatefulWidget {
  questionScreen({super.key, required this.onSelectedAnswer});
  void Function(String answer) onSelectedAnswer;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _quizzQuestion();
  }
}

class _quizzQuestion extends State<questionScreen> {
  var currentQuestionIndex = 0;

  void answeredquestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
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
                answeredquestion(e);
              },
            );
          })
        ],
      ),
    );
  }
}
