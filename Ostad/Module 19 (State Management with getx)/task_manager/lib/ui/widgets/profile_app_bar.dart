import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

AppBar profileAppBar(BuildContext context) {
  // Check if userData is null before trying to use it
  if (AuthController.userData == null) {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Icon(Icons.person, size: 50), // Placeholder icon
          ),
        ),
      ),
      title: Text(
        'Guest',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await AuthController.clearAllData();
            Get.offAllNamed('/signIn'); // Navigates to the SignIn screen
          },
          icon: const Icon(Icons.logout),
        )
      ],
    );
  }

  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: AuthController.userData!.photo != null &&
                  AuthController.userData!.photo!.isNotEmpty
              ? Image.memory(
                  base64Decode(AuthController.userData!.photo!),
                )
              : Icon(Icons.person, size: 50), // Placeholder icon
        ),
      ),
    ),
    title: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateProfileScreen(),
            ));
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
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          await AuthController.clearAllData();
          Get.offAllNamed('/'); // Navigates to the SignIn screen
        },
        icon: const Icon(Icons.logout),
      )
    ],
  );
}
