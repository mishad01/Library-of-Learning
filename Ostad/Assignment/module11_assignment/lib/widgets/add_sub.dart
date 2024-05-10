import 'package:flutter/material.dart';
import 'package:module11_assignment/data/dummy_data.dart';

class AddSub extends StatefulWidget {
  const AddSub({super.key});

  @override
  State<AddSub> createState() => _AddSubState();
}

class _AddSubState extends State<AddSub> {
  @override
  Widget build(BuildContext context) {
    final current = availableCategories[0];
    int sum = 0;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Icon(
                Icons.remove,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(current.total.toString()),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            current.price.toString(),
          ),
        ],
      ),
    );
  }
}
