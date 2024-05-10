import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module11_assignment/widgets/add_sub.dart';
import 'package:module11_assignment/widgets/colorandsize.dart';

class BagCard extends StatefulWidget {
  const BagCard({super.key});

  @override
  State<BagCard> createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 400,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        // ClipRRect to clip the inner container with border radius
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 115,
              child: Image.asset(
                'assets/images/naruto.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ColorSize(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
