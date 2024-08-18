import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controller/in_progress_task_controller.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager/ui/widgets/task_item.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch tasks when the screen initializes
    Get.find<InProgressTaskController>().fetchInProgressTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InProgressTaskController>(builder: (controller) {
        return Visibility(
          visible: !controller.getTaskInProgress,
          replacement: CenteredProgressIndicetor(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: controller.taskList.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  onUpdateTask: () {
                    // Refresh tasks if needed
                    controller.fetchInProgressTasks();
                  },
                  taskModel: controller.taskList[index],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
