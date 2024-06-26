import 'package:cpms_app/app/controllers/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  final controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Report"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.schedule), label: "Schedule"),
          ],
          onTap: (index) => controller.changePage(index),
          type: BottomNavigationBarType.fixed,
        ));
  }
}
