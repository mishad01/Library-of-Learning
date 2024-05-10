import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module11_assignment/data/dummy_data.dart';
import 'package:module11_assignment/widgets/add_sub.dart';

class ColorSize extends StatelessWidget {
  const ColorSize({
    super.key,
    required this.type,
    required this.color,
    required this.size,
  });
  final String type;
  final String color;
  final String size;

  @override
  Widget build(BuildContext context) {
    final current = availableCategories[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              type,
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
              color,
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
              size,
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
