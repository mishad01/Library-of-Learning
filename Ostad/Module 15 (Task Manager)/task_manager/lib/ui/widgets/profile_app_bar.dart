import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_color.dart';

AppBar profileAppBar() {
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
