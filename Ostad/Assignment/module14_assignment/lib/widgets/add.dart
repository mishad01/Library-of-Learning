import 'package:flutter/material.dart';

class AddNameNumber extends StatefulWidget {
  const AddNameNumber({super.key});

  @override
  State<AddNameNumber> createState() => _AddNameNumberState();
}

class _AddNameNumberState extends State<AddNameNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.green.shade50,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Number'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
