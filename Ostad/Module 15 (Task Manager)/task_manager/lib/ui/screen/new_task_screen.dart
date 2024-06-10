import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/add_new_task_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';
import 'package:task_manager/ui/widgets/task_item.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: profileAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummarySection(),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskItem();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        child: Icon(Icons.add),
        backgroundColor: AppColor.themeColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTaskScreen(),
      ),
    );
  }

  SingleChildScrollView _buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          taskSummaryCard(title: 'New Task', count: '12'),
          taskSummaryCard(title: 'Completed', count: '12'),
          taskSummaryCard(title: 'Progress', count: '12'),
          taskSummaryCard(title: 'Cancled', count: '12'),
        ],
      ),
    );
  }
}
