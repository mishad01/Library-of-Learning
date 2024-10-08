import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        backToHome();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Wish List'),
            leading: IconButton(
                onPressed: backToHome, icon: Icon(Icons.arrow_back_ios)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 7,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                //return ProductCard(product: "");
              },
            ),
          )),
    );
  }

  void backToHome() {
    return Get.find<BottomNavBarController>().backToHome();
  }
}
