import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/controller/time_count_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  void dependencies() {
    Get.lazyPut(() => TimeCountController());
    Get.lazyPut(() => BottomNavBarController());
  }
}
