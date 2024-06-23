import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/maintenance_controller.dart';

class MaintenancePage extends GetView<MaintenanceController> {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle =
        const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Maintenance'),
        ),
        body: SafeArea(
            minimum: const EdgeInsets.all(10),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      // height: MediaQuery.of(context).size.height * 0.2, // Covering 20% of the screen height
                      padding: const EdgeInsets.all(8.0),
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
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  'https://www.example.com/avatar.jpg'),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'John Doe',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '+1 234 567 890',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView(
                      children: [
                        setTile("Table", textStyle),
                        setTile("Fan", textStyle),
                        setTile("Bulb", textStyle),
                        setTile("Chairs", textStyle),
                        setTile("Chairs", textStyle),
                        setTile("Chairs", textStyle),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  Card setTile(String name, TextStyle textStyle) {
    return Card(
      child: ExpansionTile(
        title: Text(name),
        subtitle: const Text(
          "Pending",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            color: Colors.grey[300],
            padding: const EdgeInsets.all(12.0),
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    "Name",
                    style: textStyle,
                  ),
                  const Text("Table"),
                ]),
                TableRow(children: [
                  Text(
                    "ID",
                    style: textStyle,
                  ),
                  const Text("ABCD123456")
                ]),
                TableRow(children: [
                  Text(
                    "Allocatio",
                    style: textStyle,
                  ),
                  const Text("BLOCK-A")
                ]),
                TableRow(children: [
                  Text(
                    "Reported On",
                    style: textStyle,
                  ),
                  const Text("02/05/2024")
                ]),
                TableRow(children: [
                  Text(
                    "Status",
                    style: textStyle,
                  ),
                  const Text(
                    "FIXED",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Details",
                    style: textStyle,
                  ),
                  const Text("A broken right limb kdfk dfkdja adfjkfdj ...")
                ]),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/assets/table.jpeg"),
                fit: BoxFit.fill,
              ),
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
                  ),
                ),
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
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
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
