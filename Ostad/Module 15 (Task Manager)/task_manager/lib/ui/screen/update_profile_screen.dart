import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context, true),
      body: BackgroundWidget(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              'Update Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(
              width: double.maxFinite,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
          ],
        ),
      )),
    );
  }
}
