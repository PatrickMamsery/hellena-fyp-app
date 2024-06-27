import 'package:cpms_app/app/data/repository/report_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../data/services/api_client.dart';

class ReportController extends GetxController {
  // final ReportRepository repository;
  var name = TextEditingController().obs;
  var type = Rx<String?>(null); // Allow type to be null initially
  var block = Rx<String?>(null);
  var serial_number = TextEditingController().obs;
  var description = TextEditingController().obs;
  var types = <String>[
    'Electrical',
    'Electronics',
    'Furniture',
    'Computing',
    'Plumbing'
  ];
  var blocks = <String>[
    'Block A',
    'Block B',
    'Block C',
    'Block D',
  ];

  @override
  void onInit() async {
    // TODO: implement onInit
    print("REPORTS");
    super.onInit();
  }

  void submit() {
    var data = {
      "property_name": name.value.text,
      "type": type.value,
      "property_location": block.value,
      "serial_no": serial_number.value.text,
      "description": description.value.text,
    };

    var apiClient = ApiClient(
      url: '/api/reports',
    );
    var res = apiClient.postData(data);
    Get.snackbar("Sucess", "Report Created", colorText: Colors.green);
    clear();
  }

  void clear() {
    name.value.text = "";

    serial_number.value.text = "";
    description.value.text = "";
  }
}
