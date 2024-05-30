import 'package:flutter/material.dart';
import 'package:to_do_application/ui/screens/todo_list_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoListScreen(),);
  }
}
