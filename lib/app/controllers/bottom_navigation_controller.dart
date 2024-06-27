import 'package:cpms_app/app/ui/List/list.dart';
// import 'package:cpms_app/app/ui/auth/login.dart';
import 'package:cpms_app/app/ui/report/report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;


  final List<Widget> pages = [
    ReportPage(),
    ListPage(),
  ];

  void changePage(int index,String userId) {
    currentIndex.value = index;
    Get.to(()=>pages[currentIndex.value],arguments: userId );
  }
}
