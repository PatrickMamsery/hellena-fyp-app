import 'package:flutter/material.dart';

import '../data/repository/login_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // final LoginRepository repository;
  // LoginController(this.repository);

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  // void submit() {
  //   var data = {
  //     "email": email.value.text,
  //     "password": password.value.text,
  //   };

  //   var apiClient = ApiClient(
  //     url: '/api/login',
  //   );
  //   var res = apiClient.postData(data);
  //   Get.snackbar("Sucess", "Report Created", colorText: Colors.green);
  //   clear();
  // }
}
