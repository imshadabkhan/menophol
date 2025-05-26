import 'package:get/get.dart';

class MoodController extends GetxController{
  RxBool dropDown=false.obs;
  RxInt selectedIndex = (-1).obs;

  void selectMood(int index) {
    selectedIndex.value = index;
  }

  void toggleDropDown(){
    dropDown.value=!dropDown.value;



  }




  var selectedTriggers = <String, Set<String>>{}.obs;

  void toggleTrigger(String sectionKey, String value) {
    final currentSet = selectedTriggers[sectionKey] ?? <String>{};

    if (currentSet.contains(value)) {
      currentSet.remove(value);
    } else {
      currentSet.add(value);
    }

    selectedTriggers[sectionKey] = currentSet;
  }

  bool isSelected(String sectionKey, String value) {
    return selectedTriggers[sectionKey]?.contains(value) ?? false;
  }




}