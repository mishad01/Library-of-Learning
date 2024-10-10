import 'package:crafty_bay/data/model/category_list_model.dart';
import 'package:crafty_bay/data/model/category_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage = '';
  String? get errorMessage => _errorMessage;

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.categoryListUrl);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _categoryList =
          CategoryListModel.fromJson(response.responseData).categoryList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
