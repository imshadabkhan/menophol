import 'package:get/get.dart';

class MedicalConditionController extends GetxController{

  RxList  customConditionList=[

  ].obs;
  RxBool symptomAdded=false.obs;

  void addSymptomToList(String? title){
    if(!customConditionList.contains(title!)){
      customConditionList.add(title);
    }


  }



}