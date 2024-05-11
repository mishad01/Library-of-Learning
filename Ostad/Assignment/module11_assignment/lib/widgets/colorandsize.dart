import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module11_assignment/widgets/add_sub.dart';

class ColorSize extends StatelessWidget {
  ColorSize({
    super.key,
    required this.type,
    required this.color,
    required this.size,
    required this.total,
    required this.price,
  });
  final String type;
  final String color;
  final String size;
  final int total;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            // Icon(
            //   Icons.more_vert,
            //   color: const Color.fromARGB(255, 178, 177, 177),
            // ),
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
        AddSub(total: total, price: price)
      ],
    );
  }
}
