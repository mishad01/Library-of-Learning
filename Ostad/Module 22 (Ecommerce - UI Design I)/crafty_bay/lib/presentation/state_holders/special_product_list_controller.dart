import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_list_model.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class SpecialProductListController extends GetxController {
  bool _specialProductInProgress = false;
  bool get specialProductInProgress => _specialProductInProgress;

  List<ProductModel> _specialProductList = [];
  List<ProductModel> get specialProductList => _specialProductList;

  String? _specialErrorMessage;
  String? get specialErrorMessage => _specialErrorMessage;

  Future<bool> getSpecialProducts() async {
    _specialProductInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productByRemark('special'));

    bool isSuccess = false;

    if (response.isSuccess) {
      _specialProductList =
          ProductListModel.fromJson(response.responseData).productData ?? [];
      isSuccess = true;
    } else {
      _specialErrorMessage = response.errorMessage;
    }

    _specialProductInProgress = false;
    update();

    return isSuccess;
  }
}
