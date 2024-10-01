import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_list_model.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController {
  bool _popularProductInProgress = false;
  bool get popularProductInProgress => _popularProductInProgress;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  String? _popularErrorMessage;
  String? get popularErrorMessage => _popularErrorMessage;

  Future<bool> getPopularProducts() async {
    _popularProductInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productByRemark('popular'));

    bool isSuccess = false;

    if (response.isSuccess) {
      _popularProductList =
          ProductListModel.fromJson(response.responseData).productData ?? [];
      isSuccess = true;
    } else {
      _popularErrorMessage = response.errorMessage;
    }

    _popularProductInProgress = false;
    update();

    return isSuccess;
  }
}
