import 'package:get/get.dart';
import '../data/repository/list_repository.dart';

class ListController extends GetxController {
  final ListRepository repository;
  ListController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
