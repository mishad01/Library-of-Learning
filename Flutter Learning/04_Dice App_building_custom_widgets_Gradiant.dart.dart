//StatelessWidget is a fundamental class used for creating widgets that represent parts of the user interface that do not change during the lifetime of the widget.
class GradientContainer extends StatelessWidget {//Where we are making a function for text and color
  //classed that are extending stateless widghet should have a constructive function added to them 
  // GradientContainer(){
  //   //initialization
  // }
  const GradientContainer({super.key}); //We dont need to use curly baraces here all time we can just use {key} inside first bracet
                            //key parameter is used for specifying a Key object for a widget. Keys are primarily used to uniquely identify widgets, especially when working with stateful widgets or when you need to manage the state and identity of widgets across widget trees.
                            //Super referes to the parent class(statlesswidget in this class)
  @override
  Widget build(context) {
    //build method of a widget is expected to return a valid widget that describes the user interface element you want to create.
    //Context is a meta data object which that contains a useful information about this widget in the overall widget tree.As an example where this widget is positioned in the overall widget tree
    return Container(
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
  }
}
