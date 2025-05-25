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




}