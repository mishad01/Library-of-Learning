import 'dart:async';

import 'package:get/get.dart';

class TimeCountController extends GetxController {
  RxInt _count = 120.obs;
  int get count => _count.value;

  Timer? _timer;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimeCountDown({int startValue = 120}) {
    _timer?.cancel(); // Cancel any existing timer
    _count.value = startValue; // Reset count to the starting value
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_count.value == 0) {
          timer.cancel();
        } else {
          _count.value--;
        }
      },
    );
  }
}
