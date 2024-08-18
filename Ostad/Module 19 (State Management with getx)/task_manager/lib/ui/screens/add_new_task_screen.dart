import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controller/add_new_task_controller.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formState,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _subjectTEController,
                    decoration: InputDecoration(hintText: 'Subject'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your subject';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLines: 5,
                    controller: _descriptionTEController,
                    decoration: InputDecoration(hintText: 'Description'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Description correctly';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<AddNewTaskController>(
                    init: AddNewTaskController(),
                    builder: (controller) {
                      return Visibility(
                        visible: !controller.isLoading,
                        replacement: const CenteredProgressIndicetor(),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formState.currentState!.validate()) {
                              _addNewTask(controller);
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addNewTask(AddNewTaskController controller) async {
    controller.isLoading = true;

    Map<String, dynamic> requestData = {
      "title": _subjectTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    };

    bool isSuccess = await controller.addNewTask(
      requestData["title"],
      requestData["description"],
    );

    controller.isLoading = false;

    if (isSuccess) {
      _clearTextFields();
      showSnackBarMessage(context, 'New Task Added');
    } else {
      showSnackBarMessage(context, controller.errorMessage, true);
    }
  }

  void _clearTextFields() {
    _subjectTEController.clear();
    _descriptionTEController.clear();
  }

  @override
  void dispose() {
    _subjectTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}

void showSnackBarMessage(BuildContext context, String message,
    [bool isError = false]) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError ? Colors.red : Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
