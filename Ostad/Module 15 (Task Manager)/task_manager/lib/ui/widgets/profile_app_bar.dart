import 'package:flutter/material.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';

AppBar profileAppBar(context, [bool fromUpdateprofile = false]) {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
          // child: NetworkCachedImage(url: ''),
          ),
    ),
    title: GestureDetector(
      onTap: () {
        if (fromUpdateprofile) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName ?? ' ',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            AuthController.userData?.email ?? ' ',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          await AuthController.clearAllData();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
            (route) => false,
          );
        },
        icon: Icon(Icons.logout),
      )
    ],
    backgroundColor: AppColor.themeColor,
  );
}
