import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/list_repository.dart';
import '../data/services/api_client.dart';
import '../data/models/report_response.dart';

class ListController extends GetxController {
  ListController();
  final reports = <Report>[].obs;
  final ApiClient apiClient = ApiClient(url: '/api/reports');
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    getReports();
    super.onInit();
  }

  void getReports() async {
    var res = ReportResponse.fromJson(await apiClient.get());
    reports(res.data);
  }

}
