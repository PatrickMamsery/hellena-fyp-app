import 'package:cpms_app/app/data/services/api_client.dart';
import 'package:cpms_app/app/ui/maintanance/maintenance.dart';
import 'package:cpms_app/app/ui/report/report.dart';
import 'package:flutter/material.dart';

import '../data/repository/login_repository.dart';
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

  void submit() async {
    var data = {
      "email": email.value.text,
      "password": password.value.text,
      "role": role.value,
    };

    var apiClient = ApiClient(
      url: '/api/login',
    );
    var res = AuthResponse.fromJson(await apiClient.postData(data));
    print(res.data!.user!.role!);
    if (res.data!.user!.role! == "Officer") {
      Get.to(() => MaintenancePage());
    } else {
      Get.to(() => ReportPage());
    }
  }
}
