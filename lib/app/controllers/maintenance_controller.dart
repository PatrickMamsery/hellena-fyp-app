import 'package:get/get.dart';
import '../data/repository/maintenance_repository.dart';

class MaintenanceController extends GetxController {

final MaintenanceRepository repository;
MaintenanceController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}