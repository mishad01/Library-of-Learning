import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({super.key, required this.answerText, required this.onTap});
  // answerButton({
  //   super.key,
  //   required this.answerText,
  //   required this.onTap,
  // });
  @override
  void Function() onTap;
  final String answerText;
  Widget build(BuildContext context) {
    return ElevatedButton(
      //To Create Button
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 79, 23, 209),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(answerText),
    );
  }
}
