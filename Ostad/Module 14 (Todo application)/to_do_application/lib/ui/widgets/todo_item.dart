import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key,required this.todo,});

  final Todo todo;

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
}
Widget _buildCircularIconButton(){
  return CircleAvatar(child: Icon(_getIcon(true)),);
}

IconData _getIcon(bool isDone){
  return isDone ? Icons.check : Icons.clear;
}

TextDecoration? _getTextDecoration (bool isDone){
  return isDone? TextDecoration.lineThrough : null;
}