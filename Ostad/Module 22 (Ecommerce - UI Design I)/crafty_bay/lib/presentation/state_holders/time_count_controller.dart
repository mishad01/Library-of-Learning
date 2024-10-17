import 'dart:async';

import 'package:get/get.dart';

class TimeCountController extends GetxController {
  RxInt _count = 120.obs;
  int get count => _count.value;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _startTimeCountDown();
  }

  void decriment() {
    if (count > 0) {
      _count--;
      update();
    }
  }

  void _startTimeCountDown() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_count.value == 0) {
          timer.cancel();
        } else {
          decriment();
        }
      },
    );
  }
}
