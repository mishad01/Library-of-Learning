import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_list_model.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController {
  bool _newProductInProgress = false;
  bool get newProductInProgress => _newProductInProgress;

  List<ProductModel> _newProductList = [];
  List<ProductModel> get newProductList => _newProductList;

  String? _newErrorMessage;
  String? get newErrorMessage => _newErrorMessage;

  Future<bool> getNewProducts() async {
    _newProductInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productListByRemark('new'));

    bool isSuccess = false;

    if (response.isSuccess) {
      _newProductList =
          ProductListModel.fromJson(response.responseData).productData ?? [];
      isSuccess = true;
    } else {
      _newErrorMessage = response.errorMessage;
    }

    _newProductInProgress = false;
    update();

    return isSuccess;
  }
}
