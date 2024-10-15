import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/review_list_model.dart';
import 'package:crafty_bay/data/model/review_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class ReviewProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage; // Fixed getter

  List<ReviewModel> reviewList = [];
  List<ReviewModel> get reviewLists => reviewList;

  Future<bool> getReview(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update(); // Notify listeners about progress
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.reviewList(productId));
    if (response.isSuccess) {
      reviewList =
          ReviewListModel.fromJson(response.responseData).reviewData ?? [];
      isSuccess = true;
      _errorMessage = null; // Clear error if request succeeds
    } else {
      _errorMessage =
          response.errorMessage; // Set error message if request fails
    }
    _inProgress = false;
    update(); // Notify listeners after request completes
    return isSuccess;
  }
}
