// import 'package:cpms_app/app/data/repository/sign_in_repository.dart';
import 'package:cpms_app/app/data/services/api_client.dart';
import 'package:cpms_app/app/ui/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/auth_response.dart';

class SignInController extends GetxController {
  // final SignInRepository repository;
  // SignInController(this.repository);

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
  var name = TextEditingController().obs;
  var phone = TextEditingController().obs;
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;
  var role = "".obs;
  var roles = [
    'Officer',
    'User',
  ];
  // Error messages
  var nameError = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var roleError = ''.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  bool validate() {
    bool isValid = true;

    if (name.value.text.isEmpty) {
      nameError.value = 'Name is required';
      isValid = false;
    } else {
      nameError.value = '';
    }

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

    if (role.value.isEmpty) {
      roleError.value = 'Role is required';
      isValid = false;
    } else {
      roleError.value = '';
    }

    return isValid;
  }

  void submit() async {
    if (validate()) {
      var data = {
        "name": name.value.text,
        "email": email.value.text,
        "password": password.value.text,
        "role": role.value,
      };
      var apiClient = ApiClient(
        url: '/api/register',
      );
      var res = AuthResponse.fromJson(await apiClient.postData(data));
      if (res.data != null && res.data!.user != null) {
        print(res.data!.user!.role!);
        Get.snackbar("Success", "Registered Successfully");
        clear();
        Get.to(() => LoginPage());
      } else {
        Get.snackbar("Error", "Registration failed");
      }
    }
  }

  void clear() {
    name.value.text = "";
    email.value.text = "";
    password.value.text = "";
    role.value = '';

    nameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    roleError.value = '';
  }
}
