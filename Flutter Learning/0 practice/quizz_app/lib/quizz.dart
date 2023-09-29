import 'package:flutter/material.dart';
import 'package:quizz_app/questionScreen.dart';
import 'package:quizz_app/startScreen.dart';

class quizz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _quizz();
  }
}

class _quizz extends State<quizz> {
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = startScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = questionScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 100, 26, 228),
                Color.fromARGB(255, 81, 25, 177)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
