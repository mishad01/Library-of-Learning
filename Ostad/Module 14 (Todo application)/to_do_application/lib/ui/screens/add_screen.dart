import 'package:flutter/material.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _titleTEController,
                decoration:
                    InputDecoration(labelText: 'Title', hintText: 'Title')),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionTEController,
              decoration: InputDecoration(
                  labelText: 'Description', hintText: 'Description'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
