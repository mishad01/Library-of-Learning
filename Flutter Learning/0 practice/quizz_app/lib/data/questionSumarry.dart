import 'package:flutter/material.dart';

class questionsSummary extends StatelessWidget {
  const questionsSummary(this.sumarryData, {super.key});

  final List<Map<String, Object>> sumarryData;

  Widget build(BuildContext context) {
    return Column(
      children: sumarryData.map((data) {
        return Row(
          children: [
            Text(((data['question-index'] as int) + 1).toString()),
            Expanded(
              child: Column(
                children: [
                  Text(data['question'] as String),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(data['choosenanswer'] as String),
                  Text(data['correct-answer'] as String),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
