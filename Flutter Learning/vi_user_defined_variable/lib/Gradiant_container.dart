import 'package:flutter/material.dart';

var a = Alignment.topRight;
var b = Alignment.bottomLeft;

//Alternative Way 2
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: a,
          end: b,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/dice-1.png',
          width: 200, //For setting up size up the picture we usesd width
        ),
      ),
    );
  }
}
