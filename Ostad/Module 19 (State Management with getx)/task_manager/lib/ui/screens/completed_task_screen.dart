import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controller/completed_task_controller.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager/ui/widgets/task_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  //bool _getNewTaskInProgress = false;
  //List<TaskModel> completedTaskList = [];
  // completedTaskScreen = Get.find<Com>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CompletedTaskController>().getCompletedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: profileAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  Get.find<CompletedTaskController>().getCompletedTasks();
                },
                child: GetBuilder<CompletedTaskController>(
                    builder: (completedTaskController) {
                  return Visibility(
                    visible:
                        completedTaskController.getCompletedTasksInProgress ==
                            false,
                    replacement: CenteredProgressIndicetor(),
                    child: ListView.builder(
                      itemCount:
                          completedTaskController.completedTaskList.length,
                      itemBuilder: (context, index) {
                        return TaskItem(
                          color: Colors.lightGreen[700] ?? Colors.lightGreen,
                          state: 'Completed Task',
                          onUpdateTask: () {
                            Get.find<CompletedTaskController>()
                                .getCompletedTasks();
                          },
                          taskModel:
                              completedTaskController.completedTaskList[index],
                        );
                      },
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        child: Icon(Icons.add),
        backgroundColor: AppColors.themeColor,
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

  // Future<void> _getCompletedTasks() async {
  //   _getNewTaskInProgress = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   NetworkResponse response =
  //       await NetworkCaller.getRequest(Urls.completedTasks);
  //   if (response.isSuccess) {
  //     TaskListWrapper taskListWrapperModel =
  //         TaskListWrapper.fromJson(response.responseData);
  //     completedTaskList = taskListWrapperModel.taskList ?? [];
  //   } else {
  //     if (mounted) {
  //       showSnackBarMessage(
  //           context, response.errorMessage ?? 'Get new task failed! Try again');
  //     }
  //   }
  //   _getNewTaskInProgress = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }
}
