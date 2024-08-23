import 'package:flutter/material.dart';
import 'package:live_score_application/ui/flutter_local_notification_service.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image.asset('assets/images/test_icon.png'),
            ElevatedButton(
              onPressed: () {
                FlutterLocalNotificationService.scheduleNotification(
                    'Notification Test', 'My App Notification', 5);
              },
              child: const Text('Set Notification'),
            ),
            //SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                FlutterLocalNotificationService.cancelAllNotification();
              },
              child: const Text('Remove Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
