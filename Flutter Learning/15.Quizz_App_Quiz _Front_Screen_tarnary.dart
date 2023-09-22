import 'package:flutter/material.dart';
import 'package:quizz_app_practice/questionScreen.dart';
import 'package:quizz_app_practice/startScreen.dart';

class quizz extends StatefulWidget {
  quizz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _quizz();
  }
}

class _quizz extends State<quizz> {
  //Widget? activeState;
  // void initState() {
  //   activeState = startScreen(switchState);
  //   super.initState();
  // }

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 112, 55, 179),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? startScreen(switchScreen)
              : const questionScreen(),
        ),
      ),
    );
  }
}
