import 'package:get/get.dart';

class SleepTrackerController extends GetxController{
  RxBool dropDown=false.obs;

  void toggleDropDown(){
    dropDown.value=!dropDown.value;



  }





}