import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/cancelled_task_screen.dart';
import 'package:task_manager/ui/screen/completed_task_screen.dart';
import 'package:task_manager/ui/screen/in_progress_task_screen.dart';
import 'package:task_manager/ui/screen/new_task_screen.dart';
import 'package:task_manager/ui/utility/app_color.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        selectedItemColor: AppColor.themeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: AppColor.themeColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: 'Canceled'),
        ],
      ),
    );
  }
}
