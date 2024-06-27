import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/maintenance_controller.dart';
import '../../data/models/officer_response.dart';

class MaintenancePage extends GetView<MaintenanceController> {
  final MaintenanceController controller = Get.put(MaintenanceController());
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[900]);

    return Scaffold(
        appBar: AppBar(title: Text('Maintenance',),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.refresh))],backgroundColor: Colors.blue[500], ),
        body: SafeArea(
            minimum: EdgeInsets.all(10),
            child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical:  10.0),
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
    //get status color [done, Not done, in progress]
    var color = report.status == "done"
        ? Colors.green
        : report.status == "Not done"
            ? Colors.red
            : Colors.grey;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: color),
      ),
      child: ExpansionTile(
        title: Text(report.propertyName!.capitalize!, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500)),
        subtitle: Text(
          report.status!,
          style: TextStyle(color: color),
        ),
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.blue[50],
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
                  Text(report.serialNumber!)
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
                  Text(report.reportedOn!)
                ]),
                TableRow(children: [
                  Text(
                    "Status",
                    style: textStyle,
                  ),
                  Text(report.status!, style: TextStyle(color: color))
                ]),
                TableRow(children: [
                  Text(
                    "Details",
                    style: textStyle,
                  ),
                  Text(report.description!)
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
        ],
      ),
    );
  }
}
