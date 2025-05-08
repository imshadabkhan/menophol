import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';

class HomeController extends GetxController {
  var selectedMood = ''.obs;

  RxList icons = [
    Assets.moodSwingsIcon,
    Assets.unfilledHotFlushes,
    Assets.weightGainIcon,
    Assets.unfilledAnxietyIcon
  ].obs;



  RxList titleList = [
    "Mood Swings",
    "Hot Flushes",
    "Weight Gain",
    "Anxiety",
  ].obs;
}
