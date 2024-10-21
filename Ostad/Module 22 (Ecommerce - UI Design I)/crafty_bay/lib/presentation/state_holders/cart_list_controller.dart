import 'package:crafty_bay/data/model/cart_list_model.dart';
import 'package:crafty_bay/data/model/cart_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getNewProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.cartList, token: AuthController.accessToken);

    if (response.isSuccess) {
      _cartList =
          CartListModel.fromJson(response.responseData).cartListdata ?? [];
      _totalPrice = 0;
      for (CartModel cart in _cartList) {
        _totalPrice += int.parse(cart.price ?? "0");
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
