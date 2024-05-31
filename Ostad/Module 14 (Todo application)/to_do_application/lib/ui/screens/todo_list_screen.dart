import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/screens/add_screen.dart';
import 'package:to_do_application/ui/screens/all_todo_list_screen.dart';
import 'package:to_do_application/ui/screens/done_todo_list_screen.dart';
import 'package:to_do_application/ui/screens/undone_todo_list_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  List<Todo> todoList = [];
  //late TabController _tabController;
  @override
  // void initState() {
  //   _tabController = TabController(length: 3, vsync: this);
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: [
            AllTodoListTab(),
            DoneTodoListTab(),
            UndoneTodoListTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewTodo(),
                ));
          },
          tooltip: 'Add New Todo',
          label: const Text('Add'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      //controller: _tabController,
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'Done'),
        Tab(text: 'Undone'),
      ],
    );
  }
}
