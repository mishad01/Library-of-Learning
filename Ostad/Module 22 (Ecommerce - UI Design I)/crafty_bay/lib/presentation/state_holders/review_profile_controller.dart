import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/review_list_model.dart';
import 'package:crafty_bay/data/model/review_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class ReviewProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage; // Fixed getter

  List<ReviewModel> _reviewList = [];
  List<ReviewModel> get reviewList => _reviewList;

  Future<bool> getReview(int productId) async {
    _reviewList.clear();
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.reviewList(productId), token: AuthController.accessToken);

    print(response.responseData); // Add this to log the raw response

    if (response.isSuccess) {
      _reviewList =
          ReviewListModel.fromJson(response.responseData).reviewData ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}

/*
class ReviewProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage; // Fixed getter

  List<ReviewModel> _reviewList = [];
  List<ReviewModel> get reviewLists => _reviewList;

  Future<bool> getReview(int productId) async {
    _reviewList.clear();
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.reviewList(productId), token: AuthController.accessToken);

    print(response.responseData); // Add this to log the raw response

    if (response.isSuccess) {
      _reviewList =
          ReviewListModel.fromJson(response.responseData).reviewData ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}*/
