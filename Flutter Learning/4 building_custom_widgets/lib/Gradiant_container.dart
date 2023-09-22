import 'package:flutter/material.dart';
import 'package:basic_first/StyledText.dart';

//StatelessWidget is a fundamental class used for creating widgets that represent parts of the user interface that do not change during the lifetime of the widget.
class GradientContainer extends StatelessWidget {
  //Where we are making a function for text and color
  //classed that are extending stateless widghet should have a constructive function added to them
  // GradientContainer(){
  //   //initialization
  // }
  const GradientContainer(
      {super.key}); //We dont need to use curly baraces here all time we can just use {key} inside first bracet
  //key parameter is used for specifying a Key object for a widget. Keys are primarily used to uniquely identify widgets, especially when working with stateful widgets or when you need to manage the state and identity of widgets across widget trees.
  //Super referes to the parent class(statlesswidget in this class)
  @override
  Widget build(context) {
    //build method of a widget is expected to return a valid widget that describes the user interface element you want to create.
    //Context is a meta data object which that contains a useful information about this widget in the overall widget tree.As an example where this widget is positioned in the overall widget tree
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 255, 153, 0), Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      //Till now this was background and after this we wanna add text widget
      //And as I want this text to put on the background we have to use -> child :
      // child: Center(child: Text('Hello',style: TextStyle(color: Colors.white),)),
      child: Center(child: StyledText()),
    );
  }
}
