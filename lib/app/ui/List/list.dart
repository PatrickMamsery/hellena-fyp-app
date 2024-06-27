import 'package:cpms_app/app/ui/shared/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cpms_app/app/controllers/list_controller.dart';
import '../../data/models/report_response.dart';

class ListPage extends GetView<ListController> {
  final ListController controller = Get.put(ListController());
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[900]);
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(title: Text('Reports'), backgroundColor: Colors.blue , foregroundColor: Colors.white,actions: [IconButton(onPressed: ()=>controller.getReports(), icon: Icon(Icons.refresh))],),
        body: SafeArea(
            minimum: EdgeInsets.all(10),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Obx(() {
                return ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.reports.length,
                  itemBuilder: ((context, index) {
                    var report = controller.reports[index];
                    return setTile(report, textStyle);
                  }),
                );
              }),
            )));
  }

  Card setTile(Report report, TextStyle textStyle) {
    var color = report.status == "done"
        ? Colors.green
        : report.status == "Not done"
            ? Colors.red
            : Colors.grey;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(report.propertyName!.capitalize!, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500)),
        subtitle: Text(
          report.status!,
          style: TextStyle(color: color),
        ),
        children: [
          Container(
            color: Colors.blue[50],
            margin: EdgeInsets.all(8.0),
            child: Padding(
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
                      "Allocation",
                      style: textStyle,
                    ),
                    Text(report.propertyLocation!)
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
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       TextButton(
          //           onPressed: () {},
          //           child: Row(
          //             children: [
          //               Icon(
          //                 Icons.edit,
          //                 color: Colors.blue,
          //               ),
          //               Text(
          //                 "Edit Report",
          //                 style: TextStyle(color: Colors.blue),
          //               )
          //             ],
          //           )),
          //       TextButton(
          //           onPressed: () {},
          //           child: Row(
          //             children: [
          //               Icon(
          //                 Icons.delete,
          //                 color: Colors.red[500],
          //               ),
          //               Text(
          //                 "Delete Report",
          //                 style: TextStyle(color: Colors.red[500]),
          //               )
          //             ],
          //           )),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
