import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/wish_list_model.dart';
import 'package:crafty_bay/data/model/wish_list_product.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<WishListModel> _productWishList = [];
  List<WishListModel> get productWishList => _productWishList;

  Future<bool> getProductWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.productWishList, token: AuthController.accessToken);

    if (response.isSuccess) {
      _productWishList =
          WishListProduct.fromJson(response.responseData).wishListData ?? [];
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
