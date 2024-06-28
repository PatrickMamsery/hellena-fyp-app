import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../data/repository/list_repository.dart';
import '../data/services/api_client.dart';
import '../data/models/report_response.dart';

class ListController extends GetxController {
  dynamic argumentData = Get.arguments;
  var userId = "".obs;
  var sms = "".obs;
  final reports = <Report>[].obs;
  ScrollController scrollController = ScrollController();
    var  message = TextEditingController().obs;

  @override
  void onInit() {
    argumentData != null ? userId(argumentData[0].toString()) : null;
    getReports();
    super.onInit();
  }


  void getReports() async {
    final ApiClient apiClient = ApiClient(url: '/api/user_report/$userId');
    var res = ReportResponse.fromJson(await apiClient.get());
    reports(res.data);
  }

  //submit SMS
  void sendSMS() async {
    print("Sending SMS");
    final ApiClient apiClient = ApiClient(url: '/api/send_sms');
    await apiClient.postData({'message': message.value.text});
    Get.snackbar("Sucess", "Message Sent");
    Get.back();
  }
}
