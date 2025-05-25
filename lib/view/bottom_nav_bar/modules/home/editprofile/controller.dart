import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedOption = (-1).obs;

  void selectOption(int index) {
    selectedOption.value = index;
  }
}
