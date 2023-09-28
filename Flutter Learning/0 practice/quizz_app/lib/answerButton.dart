import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({super.key, required this.text, required this.onTap});
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 42, 13, 119),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(text),
    );
  }
}
