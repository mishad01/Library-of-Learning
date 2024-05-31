import 'package:flutter/cupertino.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {},
          child: TodoItem(
              todo: Todo('Title', 'description', DateTime.now()),
              onIconButtonPressed: () {}),
        );
      },
    );
  }
}
