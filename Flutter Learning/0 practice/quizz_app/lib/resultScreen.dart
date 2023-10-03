import 'package:flutter/material.dart';
import 'package:quizz_app/data/questionSumarry.dart';
import 'package:quizz_app/data/questions.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key, required this.choosenAnswer});
  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'questions': Question[i].qestionsQuizz,
        'choosed-answer': choosenAnswer[i],
        'right-answer': Question[i].answerOption[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalquestion = Question.length;
    final correctAnswer = summaryData.where((e) {
      return e['choosed-answer'] == e['right-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
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
            questionsSummary(summaryData),
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
