import 'package:flutter/material.dart'; // is used to import the material.dart library, which contains the core Flutter framework for building user interfaces with a Material Design look and feel

/* Material APP  //Root app thats required by most other widgets
       .
       .
       .
    Scaffold   //Screen Layout Widget that adds base styling and more
       .
       .
      Row     //Widget that displays multiple adjacent child widgets
..................
.       .        .
TEXT    TEXT     TEXT //Widget that displays multiple adjacent child widgets
    
 */

//Run app main job is actually to show some user interface
//any input inside run() is perameter
//MaterialApp() is the core widget we will need almost everytime
//home argument must needed inside Material app
//const is used before MaterialApp to indicate that the MaterialApp widget and its properties are compile-time constants. This means that they won't change after the app is compiled. In this case, it's applied to the entire MaterialApp widget, including its home property.
void main() {
  runApp(
    const MaterialApp(
      home: Text('Hello World'),
    ),
  );
}
