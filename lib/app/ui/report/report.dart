import 'package:cpms_app/app/controllers/report_controller.dart';
import 'package:cpms_app/app/ui/report/widgets/input.dart';
import 'package:cpms_app/app/ui/shared/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPage extends GetView<ReportController> {
  final ReportController controller = Get.put(ReportController());
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 20,
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              color: Colors.white,
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back)),
          title: Center(
              child: Text(
            'Report a Damage',
            style: TextStyle(color: Colors.white),
          ))),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                input(
                  title: "Name",
                  subtitle: "Enter the name of the property",
                  controller: controller.name.value,
                ),
                sizedBox,
                DropdownButton<String>(
                  // value: controller.type.value,
                  isExpanded: true,
                  items: controller.types.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    controller.type.value = _!;
                    print("Debug" + _!);
                  },
                ),
                // GetX<ReportController>(builder: (controller) {
                //   return;
                // }),
                sizedBox,
                Container(
                  child: DropdownButton<String>(
                    // value: controller.block.value,
                    isExpanded: true,
                    items: controller.blocks.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {
                      controller.block.value = _!;
                      print("Debug" + _!);
                    },
                  ),
                ),
                sizedBox,
                input(
                  title: "Serial Number",
                  subtitle: "Choose the serial number",
                  controller: controller.serial_number.value,
                ),
                sizedBox,
                input(
                  title: "Description",
                  subtitle: "Enter the description of the damage",
                  controller: controller.description.value,
                ),
                sizedBox,
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () => controller.submit(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 30, right: 30),
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                )
              ],
            ),
          ),
        )),
      )),
      bottomNavigationBar: BottomBar(),
    );
  }
}
