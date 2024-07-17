import 'package:get/get.dart';

// class CounterController {
//   RxInt _count = 0.obs;
//   RxInt get count => _count;
//   void incrementCount() {
//     _count++;
//   }
//
//   void decrement() {
//     _count--;
//   }
// }
class CounterController extends GetxController {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count += 1;
    update();
  }

  void decrement() {
    _count -= 1;
    update();
  }
}
