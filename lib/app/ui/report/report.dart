import 'package:cpms_app/app/controllers/report_controller.dart';
import 'package:cpms_app/app/ui/report/widgets/input.dart';
import 'package:cpms_app/app/ui/shared/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPage extends GetView<ReportController> {
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
                ),
                sizedBox,
                input(
                  title: "Type",
                  subtitle: "Enter the type of property ",
                ),
                sizedBox,
                input(
                  title: "Block",
                  subtitle: "Enter the block the property is located",
                ),
                sizedBox,
                input(
                  title: "Serial Number",
                  subtitle: "Choose the serial number",
                ),
                sizedBox,
                input(
                  title: "Description",
                  subtitle: "Enter the description of the damage",
                ),
                sizedBox,
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () => null,
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
