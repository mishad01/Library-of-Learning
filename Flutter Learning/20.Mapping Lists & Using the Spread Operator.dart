import 'package:flutter/material.dart';
import 'package:quizz_app/answerButton.dart';
import 'package:quizz_app/data/questions.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});
  @override
  State<questionScreen> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.txt,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          //Here currentQuestion.answers where answer is a list os strings
          //Map allows us to convert,to transform we could say the values in a list to to other values
          //here map wil take a function ..where function is used as a value map((){})
          //here this function which I passed to map will be execuated by dart for every list item
          //Dart will also automatically goes through entire list and executes this function on every list item
          //Dart will automatically pass the list item for which its currently executing this function here as a argument to this function
          //map((item)) as a argument to this function and here we will get the list item for which the function is currently being executed
          //In function body then we can return the transformed item so the new value we want to have in the list insted of the old item
          //Map does not change the original list instead it return a new list full of objects
          //Here inside map this will be string ..We give item the variable name..it can be something else too
          //If we get error if there is a list or iterale inside another list
          //We have to do sprading .We have to sprade this list or iterable which is generated by map into couple of individual values   using ... three dots
          // ... Its a built in keyword in dart
          //This 3 dots will simply take all the values in a list and pull them outof the list or iterable and
          //Const numbers = [1,2,3];.................numbers was added as a single value to the morenums list
          //Const mornums =[number,4]...result..[1,2,3,4]
          //const mornums = [...numbers,4]----result----[1,2,3,4]

          ...currentQuestion.answers.map((item) {
            return answerButton(txt: item, onTap: () {});
          }),
          answerButton(
            txt: currentQuestion.answers[0],
            onTap: () {},
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[1],
            onTap: () {},
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[2],
            onTap: () {},
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}