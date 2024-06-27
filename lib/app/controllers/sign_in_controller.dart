import 'package:cpms_app/app/data/repository/sign_in_repository.dart';
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
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  void submit() async {
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
    print(res.data!.user!.role!);
    Get.snackbar("Sucess", "Registered Successfully");
    Get.to(() => LoginPage());
  }
}
