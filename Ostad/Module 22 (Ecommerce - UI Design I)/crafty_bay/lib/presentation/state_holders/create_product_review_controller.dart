import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CreateProductReviewController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addReview(
      String description, int product_id, String rating) async {
    bool isSuccess = false;
    _inProgress = true;
    _errorMessage = null;
    update();

    Map<String, dynamic> addReview = {
      "description": description,
      "product_id": product_id,
      "rating": rating
    };
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: Urls.createProductReview,
      token: AuthController.accessToken,
      body: addReview,
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
