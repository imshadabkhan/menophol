import 'dart:ui';

import 'package:get/get.dart';
import 'package:menophol/core/constants/color_constants.dart';

class ValidateController extends GetxController {

  RxList<Color> colorList = [
    ColorConstants.grayColor,
    ColorConstants.severeColor,
    ColorConstants.moderateColor,
    ColorConstants.extremeColor,
    ColorConstants.darkRedColor
  ].obs;

   RxList<String> symptomsTitleList = [
    "Night Sweats",
    "Insomnia",
    "Hot Flushes",
    "Head Aches",
    "Anxiety",
    "Fatigue"
  ].obs;

   RxList<String> moodTitleList = [
    "Happy",
    "Anxious",
    "Tired",
    "irritable",
    "Content"
  ].obs;

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
