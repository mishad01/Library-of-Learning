import 'package:flutter/material.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/model/task_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilites/urls.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class TaskItem extends StatefulWidget {
  const TaskItem(
      {super.key,
      required this.taskModel,
      required this.onUpdateTask,
      required this.state,
      this.color = Colors.blue});

  final TaskModel taskModel;
  final VoidCallback onUpdateTask;
  final String state;
  final Color color;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _deleteInProgress = false;
  bool _editInProgress = false;

  String dropDownValue = '';
  List<String> statusList = [
    'New',
    'Progress',
    'Completed',
    'Cancelled',
  ];
  @override
  void initState() {
    // TODO: implement initState
    dropDownValue = widget.taskModel.status!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(
          widget.taskModel.title ?? ' ',
          style: const TextStyle(
            fontWeight: FontWeight.w700, // Bold font weight
            fontSize: 18.0, // Font size
            color: Colors.black87, // Font color
            letterSpacing: 1.2, // Spacing between letters
            fontFamily: 'Arial Rounded MT Bold',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.description ?? ' ',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0, // Font size
                color: Colors.black87, // Font color
                letterSpacing: 1.2, // Spacing between letters
                fontFamily: 'Times New Roman',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date : ${widget.taskModel.createdDate}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.state,
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  backgroundColor: widget.color,
                ),
                ButtonBar(
                  children: [
                    Visibility(
                      visible: _deleteInProgress == false,
                      replacement: CenteredProgressIndicetor(),
                      child: IconButton(
                          onPressed: () {
                            _deleteTask();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                    Visibility(
                      visible: _editInProgress == false,
                      replacement: CenteredProgressIndicetor(),
                      child: _buildEditButton(),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return PopupMenuButton<String>(
        icon: const Icon(
          Icons.edit,
          color: Colors.green,
        ),
        onSelected: (String selectedValue) {
          dropDownValue = selectedValue;
          _updateTask(dropDownValue);
        },
        itemBuilder: (BuildContext context) {
          return statusList.map((String value) {
            return PopupMenuItem<String>(
              value: value,
              child: ListTile(
                title: Text(value),
                trailing:
                    dropDownValue == value ? const Icon(Icons.done) : null,
              ),
            );
          }).toList();
        });
  }

  Future<void> _deleteTask() async {
    _deleteInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.deleteTask(widget.taskModel.sId!));
    if (response.isSuccess) {
      widget.onUpdateTask();
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get new task failed! Try again');
      }
    }
    _deleteInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _updateTask(String status) async {
    _editInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response = await NetworkCaller.getRequest(
        Urls.updateTask(widget.taskModel.sId!, status));
    if (response.isSuccess) {
      widget.onUpdateTask();
    } else {
      if (mounted) {
        showSnackBarMessage(
            context,
            response.errorMessage ??
                'Get update task status failed! Try again');
      }
    }
    _editInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
