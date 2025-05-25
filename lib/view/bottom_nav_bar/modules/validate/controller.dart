import 'package:get/get.dart';

class ValidateController extends GetxController {
  var selectedIndex = 0.obs;

  String get currentRange {
    switch (selectedIndex.value) {
      case 0:
        return "Last 7 Days";
      case 1:
        return "Last 14 Days";
      case 2:
        return "Last 30 Days";
      default:
        return "";
    }
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
