import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton(this.text, {super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
    );
  }
}
