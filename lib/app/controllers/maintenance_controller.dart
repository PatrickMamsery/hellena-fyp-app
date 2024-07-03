import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import '../data/repository/maintenance_repository.dart';
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

  void refresh() {
    isLoading(true);
    getOfficer();
    print("REFRESHED");
    // update();
  }

  void getOfficer() async {
    var api = ApiClient(url: "/api/officer/${officerId.value}");
    var res = OfficerResponse.fromJson(await api.get());
    officer(res.user);
    reports(res.reports);
    if (reports.length != 0) {
      isLoading(false);
    }
    print(res);
  }

  void updateReportStatus(Report report) async {
    var api = ApiClient(url: "/api/reports/${report.id}");
    var data = {"status": "Fixed"};
    var response = await api.putData(data);
    refresh();
    if (response['success']) {
      // Assuming the API returns the updated report
      var updatedReport = Report.fromJson(response['data']);
      var index = reports.indexWhere((r) => r.id == updatedReport.id);
      if (index != -1) {
        reports[index] = updatedReport;
        reports.refresh();
      }
    }
  }
}
