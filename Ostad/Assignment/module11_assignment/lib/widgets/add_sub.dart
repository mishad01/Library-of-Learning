import 'package:flutter/material.dart';
import 'package:module11_assignment/data/dummy_data.dart';

class AddSub extends StatefulWidget {
  AddSub({
    super.key,
    required this.total,
    required this.price,
    required this.onQuantityChanged, // Add this line
  });

  final int total;
  final int price;
  final Function(int) onQuantityChanged; // Add this line

  @override
  State<AddSub> createState() => _AddSubState();
}

class _AddSubState extends State<AddSub> {
  int value = 0;

  void _increment() {
    setState(() {
      value++;
      widget.onQuantityChanged(value * widget.price); // Update total
    });
  }

  void _decrement() {
    setState(() {
      if (value > 0) {
        value--;
        widget.onQuantityChanged(value * widget.price); // Update total
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: _decrement,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(value.toString()), // Display the updated value
          const SizedBox(width: 15),
          GestureDetector(
            onTap: _increment,
            child: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 90,
          ),
          Row(
            children: [
              Text(
                (widget.price * value).toString(), // Display the total price
              ),
              const Text(
                '\$',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
