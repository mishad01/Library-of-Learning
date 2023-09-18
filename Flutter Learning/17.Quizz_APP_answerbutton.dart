import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  const answerButton(this.answerText, {super.key});
  @override
  final String answerText;
  Widget build(BuildContext context) {
    return ElevatedButton(
      //To Create Button
      onPressed: () {},
      child: Text(answerText),
    );
  }
}
