import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0)),
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'All Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontSize: 15),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: AppColors.themeColor),
                    ),
                  )
                ],
              )
              /*const Center(
                child: Text('Home Screen'),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
