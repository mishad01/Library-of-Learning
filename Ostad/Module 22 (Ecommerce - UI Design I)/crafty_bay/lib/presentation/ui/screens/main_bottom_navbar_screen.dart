import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  final BottomNavBarController _navBarController =
      Get.find<BottomNavBarController>();
  int _selectIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishScreen()
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<SliderListController>().getSliderList();
    Get.find<CategoryListController>().getCategoryList();
    // Get.find<ProductListByRemarkController>().ge;
    Get.find<CategoryListController>().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navBarController.selectedIndex,
          onTap: _navBarController.changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Wish'),
          ],
          type: BottomNavigationBarType
              .fixed, // or BottomNavigationBarType.shifting
          iconSize: 20, // Adjust icon size
          selectedFontSize: 12, // Adjust selected label font size
          unselectedFontSize: 10, // Adjust unselected label font size
          selectedItemColor: Colors.blue, // Customize selected item color
          unselectedItemColor: Colors.grey, // Customize unselected item color
        ),
        body: _screens[_navBarController.selectedIndex],
        /*bottomNavigationBar: NavigationBar(
          selectedIndex: _navBarController.selectedIndex,
          onDestinationSelected: _navBarController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category), label: 'Categories'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.card_giftcard), label: 'Wish'),
          ],
        ),
        body: _screens[_navBarController.selectedIndex],*/
      );
    });
  }
}
