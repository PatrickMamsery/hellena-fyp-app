import 'package:cpms_app/app/controllers/report_controller.dart';
import 'package:cpms_app/app/ui/shared/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPage extends GetView<ReportController> {
  final ReportController controller = Get.put(ReportController());
  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(
      height: 20,
    );
    return Scaffold(
      bottomNavigationBar: BottomBar(
        userId: controller.userId.value,
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              color: Colors.white,
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'Report a Fault',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          children: [
            Obx(
              () {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        input(
                          title: "Name",
                          subtitle: "Enter the name of the property",
                          controller: controller.name.value,
                        ),
                        sizedBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Property Type",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue[500])),
                            DropdownButton<String>(
                              underline: Container(
                                height: 1.5,
                                color: Colors.grey,
                              ),
                              padding: const EdgeInsets.only(bottom: 3),
                              value: controller.type.value,
                              isExpanded: true,
                              hint: const Text(
                                "Select the type of property",
                              ),
                              items: controller.types.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.type.value = newValue;
                                print("Debug " + (newValue ?? 'null'));
                              },
                            ),
                          ],
                        ),
                        sizedBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Property Location",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue[500])),
                            DropdownButton<String>(
                              underline: Container(
                                height: 1.5,
                                color: Colors.grey,
                              ),
                              padding: const EdgeInsets.only(bottom: 3),
                              value: controller.block.value,
                              isExpanded: true,
                              hint: const Text(
                                "Select the location",
                              ),
                              items: controller.blocks.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.block.value = newValue;
                                print("Debug " + (newValue ?? 'null'));
                              },
                            ),
                          ],
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
                        sizedBox,
                        sizedBox,
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 10,
                              minimumSize: const Size(250, 50),
                            ),
                            onPressed: () => controller.submit(),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 30, right: 30),
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget input({
    required String title,
    required String subtitle,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: Colors.blue[500])),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: subtitle,
          ),
        ),
      ],
    );
  }
}
