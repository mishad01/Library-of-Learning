import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:get/get.dart';

class DeleteCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage = '';
  String? get errorMessage => _errorMessage;

  Future<bool> deleteCart(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    if (AuthController.accessToken == null) {
      _errorMessage = "Access token is missing.";
      _inProgress = false;
      update();
      return false;
    }

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.deleteCartList(productId), token: AuthController.accessToken);

    if (response.isSuccess && response.responseData["msg"] == "success") {
      isSuccess = true;
      _errorMessage = null;

      // successful deletion
      Get.find<CartListController>().getNewProducts();
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
