import 'package:flutter/material.dart';
import 'package:user_variable_prac/textTest.dart';

var a = Alignment.topCenter;
var b = Alignment.bottomCenter;

class gradientContainer extends StatelessWidget {
  gradientContainer({super.key, required this.colors});
  List<Color> colors;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color.fromARGB(255, 66, 60, 60), Colors.cyan],
          begin: a,
          end: b,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/dice-1.png',
          width: 200,
        ),
      ),
    );
  }
}
