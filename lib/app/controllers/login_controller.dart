import 'package:cpms_app/app/data/services/api_client.dart';
import 'package:cpms_app/app/ui/maintanance/maintenance.dart';
import 'package:cpms_app/app/ui/report/report.dart';
import 'package:flutter/material.dart';
// import '../data/repository/login_repository.dart';
import 'package:get/get.dart';
import '../data/models/auth_response.dart';

class LoginController extends GetxController {
  // final LoginRepository repository;
  // LoginController(this.repository);

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;

  var emailError = ''.obs;
  var passwordError = ''.obs;
  var loginError = ''.obs;

  var role = "".obs;
  var roles = [
    'Officer',
    'Reporter',
  ];
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  bool validate() {
    bool isValid = true;

    if (email.value.text.isEmpty) {
      emailError.value = 'Email is required';
      isValid = false;
    } else if (!GetUtils.isEmail(email.value.text)) {
      emailError.value = 'Enter a valid email';
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (password.value.text.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else if (password.value.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    return isValid;
  }

  void clearFields() {
    email.value.clear();
    password.value.clear();
    emailError.value = '';
    passwordError.value = '';
    loginError.value = '';
  }

  void submit() async {
    if (validate()) {
      var data = {
        "email": email.value.text,
        "password": password.value.text,
        "role": role.value,
      };

      var apiClient = ApiClient(
        url: '/api/login',
      );

      try {
        var res = AuthResponse.fromJson(await apiClient.postData(data));

        if (res.data != null && res.data!.user != null) {
          clearFields(); // Clear the fields after successful login
          if (res.data!.user!.role! == "Officer") {
            Get.to(() => MaintenancePage(), arguments: [res.data!.user!.id]);
          } else {
            Get.to(() => ReportPage(), arguments: [res.data!.user!.id]);
          }
        } else {
          loginError.value = 'Invalid email or password';
          Get.snackbar("Error", loginError.value);
        }
      } catch (e) {
        loginError.value = 'Login failed';
        Get.snackbar("Error", loginError.value);
      }
    }
  }
}
