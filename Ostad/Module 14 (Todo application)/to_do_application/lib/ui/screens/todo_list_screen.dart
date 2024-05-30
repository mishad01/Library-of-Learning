import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/widgets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return TodoItem(
              todo: Todo('Title', 'description', DateTime.now()),
              onIconButtonPressed: () {});
        },
      ),
    );
  }
}
