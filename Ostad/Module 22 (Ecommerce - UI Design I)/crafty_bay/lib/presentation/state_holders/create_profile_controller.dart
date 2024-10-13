import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> createProfile(
    String firstName,
    String lastName,
    String mobile,
    String city,
    String shippingAddress,
    String postCode, // Consider using this dynamically
    String token,
  ) async {
    bool isSuccess = false;
    _inProgress = true;
    _errorMessage = null; // Reset error message before making the request
    update();

    Map<String, dynamic> completeProfile = {
      "cus_name": "$firstName $lastName",
      "cus_add": shippingAddress,
      "cus_city": city,
      "cus_state": city, // Assuming state is the same as city
      "cus_postcode": postCode,
      "cus_country": "Bangladesh",
      "cus_phone": mobile,
      "cus_fax": mobile,
      "ship_name": "$firstName $lastName",
      "ship_add": shippingAddress,
      "ship_city": city,
      "ship_state": city,
      "ship_postcode": postCode,
      "ship_country": "Bangladesh",
      "ship_phone": mobile,
      "created_at": DateTime.now()
          .toIso8601String(), // Better to dynamically assign timestamps
      "updated_at": DateTime.now().toIso8601String(),
    };

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(
            url: Urls.createProfile, body: completeProfile, token: token);

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
