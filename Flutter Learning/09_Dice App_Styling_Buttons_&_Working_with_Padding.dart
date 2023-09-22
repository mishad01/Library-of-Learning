import 'package:flutter/material.dart';

var a = Alignment.topCenter;
var b = Alignment.bottomCenter;

class gradientContainer extends StatelessWidget {
  gradientContainer({super.key, required this.colors});
  List<Color> colors;
  void rolldice() {}
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
        child: Column(
          //Its by default takes all the vartical space
          //So if wanna make it vartically centered we use this
          mainAxisSize: MainAxisSize.min, //using this we centered it
          children: [
            //Here it will take a list of widget
            Image.asset(
              'assets/images/dice-1.png',
              width: 200,
            ),
            const SizedBox(
              height: 20, //alternative of padding
            ),
            TextButton(
              onPressed: rolldice,
              style: TextButton.styleFrom(
                //padding: const EdgeInsets.only(top: 20),
                //Padding is mainly giving space
                /*padding: This is a property that specifies the padding for a widget. Padding is the space around the content of a widget.

                      const EdgeInsets.only(top: 20): This is an instance of the EdgeInsets class with a constant value. EdgeInsets is a class in Flutter used to represent insets, which define padding for each side of a rectangle (top, right, bottom, and left).

                      only: This is a named constructor of the EdgeInsets class that allows you to specify padding for only one side of the rectangle while leaving the other sides as zero padding.

                      top: 20: This specifies that there should be 20 units of padding at the top of the widget, while the padding for the other sides will be zero.*/
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: const Text('Roll Dice'),
            )
          ],
        ),
      ),
    );
  }
}
