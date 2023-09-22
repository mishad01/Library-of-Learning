import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StyledText extends StatelessWidget {
  StyledText(this.txt,
      {super.key}); //If want to set variable by user we go in this formate
  String
      txt; //If we wanna use this.txt out String name also have to be the sane
  //We can also set value like this StyledText(String txt,{super.key}): a = txt;String a;
  @override
  Widget build(context) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    );
  }
}
