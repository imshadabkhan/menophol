import 'package:get/get.dart';

class GlpMedicationDatabaseController extends GetxController {

  var selectedIndex = 0.obs;


  void changeTab(int index) {
    selectedIndex.value = index;
  }
}