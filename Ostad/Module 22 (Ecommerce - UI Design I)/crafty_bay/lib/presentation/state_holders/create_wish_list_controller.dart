import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CreateWishListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> createWishList(String productId) async {
    bool isSuccess = false;

    if (AuthController.accessToken == null) {
      _errorMessage = "Access token is missing.";
      return false;
    }

    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.createWishList(productId),
      token: AuthController.accessToken,
    );

    if (response.isSuccess &&
        response.responseData["msg"].toString() == "success") {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage ?? "Failed to create wishlist.";
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
