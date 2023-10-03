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
                  Text(data['questions'] as String),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data['choosed-answer'] as String),
                  Text(data['right-answer'] as String),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
