import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Todo List'),),
      body: ListView.builder(itemCount: 5,itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Titile',style: TextStyle(decoration: _getTextDecoration(true)),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description'),
                Text('time'),
              ],
            ),
            trailing:_buildCircularIconButton(),
          ),
        );
      },),
    );
  }
  Widget _buildCircularIconButton(){
    return CircleAvatar(child: Icon(_getIcon(true),),);
  }

  IconData _getIcon(bool isDone){
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration (bool isDone){
    return isDone? TextDecoration.lineThrough : null;
  }
}

