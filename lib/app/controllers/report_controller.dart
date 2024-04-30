import 'package:cpms_app/app/data/repository/report_repository.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final ReportRepository repository;
  ReportController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
