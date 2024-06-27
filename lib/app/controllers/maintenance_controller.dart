import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../data/repository/maintenance_repository.dart';
import '../data/models/officer_response.dart';
import '../data/services/api_client.dart';

class MaintenanceController extends GetxController {
  // MaintenanceController();
  dynamic argumentData = Get.arguments;
  var officerId = "".obs;

  final officer = User().obs;
  ScrollController scrollController = ScrollController();
  final reports = <Report>[].obs;
  final isLoading = true.obs;
  @override
  void onInit() async {
    argumentData != null ? officerId(argumentData[0].toString()) : null;
    getOfficer();
    await Future.delayed(Duration(seconds: 4))
        .then((value) => isLoading(false));
    super.onInit();
  }

  void getOfficer() async {
    var api = ApiClient(url: "/api/officer/${officerId.value}");
    var res = OfficerResponse.fromJson(await api.get());
    officer(res.user);
    reports(res.reports);
    print(res);
  }
}
