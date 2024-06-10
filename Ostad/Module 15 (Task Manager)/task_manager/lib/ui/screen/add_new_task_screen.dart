import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _subjectTEController = TextEditingController();
    final TextEditingController _describeTEController = TextEditingController();
    return Scaffold(
      appBar: profileAppBar(),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _subjectTEController,
                decoration: const InputDecoration(hintText: 'Subject'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 4,
                controller: _describeTEController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
