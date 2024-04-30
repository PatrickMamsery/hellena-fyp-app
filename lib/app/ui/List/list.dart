import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cpms_app/app/controllers/list_controller.dart';

class ListPage extends GetView<ListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ListPage')),
        body: SafeArea(child: Text('ListController')));
  }
}
