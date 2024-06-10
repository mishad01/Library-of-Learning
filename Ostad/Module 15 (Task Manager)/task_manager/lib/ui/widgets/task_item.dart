import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text('Title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description lksfdjh;asdkhfsdkfh'),
            Text(
              'Date : 12/12/2024',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text('New'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
