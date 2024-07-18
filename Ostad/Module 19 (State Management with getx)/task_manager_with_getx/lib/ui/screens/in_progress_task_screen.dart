import 'package:flutter/material.dart';
import 'package:task_manager_with_getx/data/model/network_response.dart';
import 'package:task_manager_with_getx/data/model/task_list_wrapper.dart';
import 'package:task_manager_with_getx/data/model/task_model.dart';
import 'package:task_manager_with_getx/data/network_caller/network_caller.dart';
import 'package:task_manager_with_getx/data/utilites/urls.dart';
import 'package:task_manager_with_getx/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager_with_getx/ui/widgets/snack_bar_message.dart';
import 'package:task_manager_with_getx/ui/widgets/task_item.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  bool _getTaskInProgress = false;
  List<TaskModel> _taskList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNewTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getTaskInProgress == false,
        replacement: CenteredProgressIndicetor(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: _taskList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                taskModel: _taskList[index],
                onUpdateTask: () {
                  _getNewTasks();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getNewTasks() async {
    _getTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.progressTasks);
    if (response.isSuccess) {
      TaskListWrapper taskListWrapperModel =
          TaskListWrapper.fromJson(response.responseData);
      _taskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get new task failed! Try again');
      }
    }
    _getTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
