import 'package:flutter/material.dart';

//Basic Styling
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          //Here after right click on center we go to refector and container option
          //Using Container we can lay more with background color and all
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Colors.blue,
              ], //If I want color from top to bottom that means half orange and half blue we use this
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Center(
            child: Text(
              //IF we wanna play with text size we go like this
              'Hello World',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
