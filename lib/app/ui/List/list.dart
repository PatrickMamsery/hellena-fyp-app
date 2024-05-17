import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cpms_app/app/controllers/list_controller.dart';

class ListPage extends GetView<ListController> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.w500,color: Colors.grey);
    return Scaffold(
        appBar: AppBar(title: Text('Reports')),
        body: SafeArea(
          minimum: EdgeInsets.all(10),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ListView( children: [
            setTile("Table",textStyle),
            setTile("Fan",textStyle),
            setTile("Bulb",textStyle),
            setTile("Chairs",textStyle),
            setTile("Chairs",textStyle),
            setTile("Chairs",textStyle),
                    ],),
          )
    ),);
  }

  Card setTile(String name, TextStyle textStyle) {
    return Card(
            child: ExpansionTile(
              title: Text(name),
              subtitle: Text("fixed",style: TextStyle(color: Colors.green),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Table(
                    children: [
                      TableRow(children:[Text("Name", style: textStyle,), Text("Table")] ),
                      TableRow(children:[Text("ID",style: textStyle,), Text("ABCD123456")] ),
                      TableRow(children:[Text("Allocatio",style: textStyle,), Text("BLOCK-A")] ),
                      TableRow(children:[Text("Reported On",style: textStyle,), Text("02/05/2024")] ),
                      TableRow(children:[Text("Status",style: textStyle,), Text("FIXED",style: TextStyle(color: Colors.green))] ),
                      TableRow(children:[Text("Details",style: textStyle,), Text("A broken right limb kdfk dfkdja adfjkfdj ...")] ),
                      ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      TextButton(onPressed: (){}, child: Row(children: [Icon(Icons.edit, color: Colors.blue,),Text("Edit Report",style: TextStyle(color: Colors.blue),)],)),
                      TextButton(onPressed: (){}, child: Row(children: [Icon(Icons.delete, color: Colors.red[500],),Text("Delete Report",style: TextStyle(color: Colors.red[500]),)],)),
                    ],
                  ),
                )
              ],
              ),
          );
  }
}
