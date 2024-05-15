import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module11_assignment/widgets/add_sub.dart';
import 'package:module11_assignment/widgets/colorandsize.dart';

class BagCard extends StatefulWidget {
  BagCard({
    super.key,
    required this.image,
    required this.type,
    required this.color,
    required this.size,
    required this.total,
    required this.price,
    required this.onQuantityChanged, // Add this line
  });

  final String image;
  final String type;
  final String color;
  final String size;
  final int total;
  final int price;
  final Function(int) onQuantityChanged; // Add this line

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
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 115,
              child: Image.asset(
                'assets/images/${widget.image}',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ColorSize(
                    type: widget.type,
                    color: widget.color,
                    size: widget.size,
                    total: widget.total,
                    price: widget.price,
                    onQuantityChanged:
                        widget.onQuantityChanged, // Pass callback
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
