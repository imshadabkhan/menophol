import 'package:get/get.dart';

class ExerciseController extends GetxController {
  var selectedActivityType = ''.obs;
  var selectedActivity = ''.obs;

  void selectActivity(String activity) {
    selectedActivity.value = activity;
  }

  void selectActivityType(String value) {
    selectedActivityType.value = value;
  }
}