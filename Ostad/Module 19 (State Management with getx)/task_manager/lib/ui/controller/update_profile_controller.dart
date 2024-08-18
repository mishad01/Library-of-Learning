import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilites/urls.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';

class UpdateProfileController extends GetxController {
  bool _updateProfileInProgress = false;
  bool get updateProfileInProgress => _updateProfileInProgress;

  Future<void> updateProfile(
    String email,
    String firstName,
    String lastName,
    String mobile,
    String? password,
    File? selectedImage,
  ) async {
    _updateProfileInProgress = true;
    update();

    String encodedPhoto = AuthController.userData?.photo ?? ' ';

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };

    if (password != null && password.isNotEmpty) {
      requestBody['password'] = password;
    }

    if (selectedImage != null) {
      encodedPhoto = base64Encode(selectedImage.readAsBytesSync());
      requestBody['photo'] = encodedPhoto;
    }

    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.upDateProfile, body: requestBody);

    if (response.isSuccess && response.responseData['status'] == 'success') {
      UserModel userModel = UserModel(
        email: email,
        photo: encodedPhoto,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
      );
      AuthController.saveUserData(userModel);
      Get.snackbar(
        'Success',
        response.errorMessage ?? 'Profile Updated',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        response.errorMessage ?? 'Profile Update failed, try again!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    _updateProfileInProgress = false;
    update();
  }
}
