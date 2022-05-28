import 'package:get/get.dart';

// Clase para poder controlar los filtros
class SelectedListController extends GetxController {
  final _selectedList = List<String>.empty(growable: true).obs;
  getSelectedList() => _selectedList;
  setSelectedList(List<String> list) => _selectedList.value = list;
}
