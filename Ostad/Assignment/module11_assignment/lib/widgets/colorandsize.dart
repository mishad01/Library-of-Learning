import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module11_assignment/widgets/add_sub.dart';

class ColorSize extends StatelessWidget {
  const ColorSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Pullover',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 150,
            ),
            Icon(
              Icons.more_vert,
              color: const Color.fromARGB(255, 178, 177, 177),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color: ',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Text(
              'Black',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Size: ',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Text(
              'L',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        AddSub(),
      ],
    );
  }
}
