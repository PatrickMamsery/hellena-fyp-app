import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/maintenance_controller.dart';
import '../../data/models/officer_response.dart';

class MaintenancePage extends GetView<MaintenanceController> {
  final MaintenanceController controller = Get.put(MaintenanceController());
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);

    return Scaffold(
        appBar: AppBar(title: Text('Maintenance')),
        body: SafeArea(
            minimum: EdgeInsets.all(10),
            child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          // height: MediaQuery.of(context).size.height * 0.2, // Covering 20% of the screen height
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: GetX<MaintenanceController>(
                              builder: (controller) {
                            return controller.isLoading.value
                                ? Container()
                                : Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 40.0,
                                          backgroundImage:
                                              AssetImage('assets/avatar.jpeg'),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              controller.officer.value.name!,
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              controller.officer.value.email!,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                          })),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Obx(() {
                        return controller.isLoading.value
                            ? Container()
                            : ListView.builder(
                                controller: controller.scrollController,
                                itemCount: controller.reports.length,
                                itemBuilder: ((context, index) {
                                  var report = controller.reports[index];
                                  return setTile(report, textStyle);
                                }),
                              );
                      }),
                    ),
                  ],
                ))));
  }

  Card setTile(Report report, TextStyle textStyle) {
    return Card(
      child: ExpansionTile(
        title: Text(report.propertyName!),
        // title: Text('report.propertyName!'),
        subtitle: Text(
          report.status!,
          // 'report.status!',
          style: TextStyle(color: Colors.red),
        ),
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            color: Color.fromARGB(255, 216, 228, 220),
            padding: const EdgeInsets.all(12.0),
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    "Name",
                    style: textStyle,
                  ),
                  Text(report.propertyName!)
                ]),
                TableRow(children: [
                  Text(
                    "ID",
                    style: textStyle,
                  ),
                  Text("ABCD123456")
                ]),
                TableRow(children: [
                  Text(
                    "Allocatio",
                    style: textStyle,
                  ),
                  Text("BLOCK-A")
                ]),
                TableRow(children: [
                  Text(
                    "Reported On",
                    style: textStyle,
                  ),
                  Text("02/05/2024")
                ]),
                TableRow(children: [
                  Text(
                    "Status",
                    style: textStyle,
                  ),
                  Text("FIXED", style: TextStyle(color: Colors.green))
                ]),
                TableRow(children: [
                  Text(
                    "Details",
                    style: textStyle,
                  ),
                  Text("A broken right limb kdfk dfkdja adfjkfdj ...")
                ]),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/table.jpeg'), fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        ),
                        Text(
                          "Schedule Manintance",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    )),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      Text(
                        "Fixed",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
