import 'package:flutter/material.dart';
import 'package:quizz_app_practice/data/Questions.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});
  @override
  State<questionScreen> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  final currentQuestion = questions[0];
  @override
  Widget build(context) {
    return SizedBox(
      //To get a full background we used sized box refector for coloumn
      width: double.infinity, //This is to get a complete background
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The Question',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            //To Create Button
            onPressed: () {},
            child: Text('Answer1'),
          ),
          ElevatedButton(
            //To Create Button
            onPressed: () {},
            child: Text('Answer2'),
          ),
          ElevatedButton(
            //To Create Button
            onPressed: () {},
            child: Text('Answer3'),
          ),
        ],
      ),
    );
  }
}
