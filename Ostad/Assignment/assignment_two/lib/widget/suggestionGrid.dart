import 'package:flutter/material.dart';

class SuggestionGrid extends StatelessWidget {
  SuggestionGrid({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 166,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            color: Colors.grey,
            blurRadius: 5,
          )
        ],
        image: DecorationImage(
          image: AssetImage('assets/images/$text'),
          fit: BoxFit.cover,
          alignment: FractionalOffset(0.5, 0.1),
        ),
      ),
    );
  }
}
