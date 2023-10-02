import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key, required this.choosenAnswer});
  final List<String> choosenAnswer;

  List<Map<String, Object>> gerSumarryData() {
    final List<Map<String, Object>> sumarry = [];

    for (int i = 0; i < choosenAnswer.length; i++) {
      sumarry.add({
        'question-index': i,
        'question': Question[i].qestionsQuizz,
        'choosenanswer': Question[i].answerOption[0],
        'correct-answer': Question[i].answerOption[0],
      });
    }
    return sumarry;
  }

  @override
  Widget build(BuildContext context) {
    final totalquestion = Question.length;
    final correctAnswer = choosenAnswer.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'From $totalquestion Question Total Right Answer $correctAnswer',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Start Quizz'),
            ),
          ],
        ),
      ),
    );
  }
}
