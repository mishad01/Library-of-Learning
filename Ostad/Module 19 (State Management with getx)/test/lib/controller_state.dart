// class CounterStateController extends GetxController {
//   RxInt count = 0.obs;
//   increment() {
//     count += 1;
//   }
// }

import 'package:get/get.dart';

class CounterStateController extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }
}
