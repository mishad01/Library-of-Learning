import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_color.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profile_app_bar(),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              children: [
                taskSummaryCard(title: 'New Task', count: '12'),
                taskSummaryCard(title: 'Completed', count: '12'),
                taskSummaryCard(title: 'Progress', count: '12'),
                taskSummaryCard(title: 'Cancled', count: '12'),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar profile_app_bar() {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
            // child: NetworkCachedImage(url: ''),
            ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rabbil Hasan',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            'xyz@gmail.com',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout),
        )
      ],
      backgroundColor: AppColor.themeColor,
    );
  }
}

class taskSummaryCard extends StatelessWidget {
  const taskSummaryCard({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}
