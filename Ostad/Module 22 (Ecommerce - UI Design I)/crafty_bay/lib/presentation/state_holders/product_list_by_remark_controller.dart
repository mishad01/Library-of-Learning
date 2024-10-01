import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_list_model.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductListByRemarkController extends GetxController {
  bool _popularProductInProgress = false;
  bool _specialProductInProgress = false;
  bool _newProductInProgress = false;

  bool get popularProductInProgress => _popularProductInProgress;
  bool get specialProductInProgress => _specialProductInProgress;
  bool get newProductInProgress => _newProductInProgress;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> _specialProductList = [];
  List<ProductModel> _newProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;
  List<ProductModel> get specialProductList => _specialProductList;
  List<ProductModel> get newProductList => _newProductList;

  String? _popularErrorMessage;
  String? _newErrorMessage;
  String? _specialErrorMessage;

  String? get popularErrorMessage => _popularErrorMessage;
  String? get newErrorMessage => _newErrorMessage;
  String? get specialErrorMessage => _specialErrorMessage;

  Future<bool> getProductByRemark(String remark) async {
    bool isSuccess = false;
    if (remark == 'popular') {
      _popularProductInProgress = true;
    } else if (remark == 'special') {
      _specialProductInProgress = true;
    } else if (remark == 'new') {
      _newProductInProgress = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productByRemark(remark));

    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularProductList =
            ProductListModel.fromJson(response.responseData).productData ?? [];
      } else if (remark == 'special') {
        _specialProductList =
            ProductListModel.fromJson(response.responseData).productData ?? [];
      } else if (remark == 'new') {
        _newProductList =
            ProductListModel.fromJson(response.responseData).productData ?? [];
      }
      isSuccess = true;
    } else {
      if (remark == 'popular') {
        _popularErrorMessage = response.errorMessage;
      } else if (remark == 'special') {
        _specialErrorMessage = response.errorMessage;
      } else if (remark == 'new') {
        _newErrorMessage = response.errorMessage;
      }
    }

    if (remark == 'popular') {
      _popularProductInProgress = false;
    } else if (remark == 'special') {
      _specialProductInProgress = false;
    } else if (remark == 'new') {
      _newProductInProgress = false;
    }
    update();
    return isSuccess;
  }
}
