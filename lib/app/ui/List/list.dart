import 'package:cpms_app/app/ui/shared/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cpms_app/app/controllers/list_controller.dart';
import '../../data/models/report_response.dart';

class ListPage extends GetView<ListController> {
  final ListController controller = Get.put(ListController());
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(title: Text('Reports')),
        body: SafeArea(
            minimum: EdgeInsets.all(10),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              // child: ListView(
              //   children: [
              //     setTile("Table", textStyle),
              //     setTile("Fan", textStyle),
              //     setTile("Bulb", textStyle),
              //     setTile("Chairs", textStyle),
              //     setTile("Chairs", textStyle),
              //     setTile("Chairs", textStyle),
              //   ],
              // ),
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
    return Card(
      child: ExpansionTile(
        title: Text(report.propertyName!),
        subtitle: Text(
          report.status!,
          style: TextStyle(color: Colors.green),
        ),
        children: [
          Padding(
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
                  Text(report.status!, style: TextStyle(color: Colors.green))
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
