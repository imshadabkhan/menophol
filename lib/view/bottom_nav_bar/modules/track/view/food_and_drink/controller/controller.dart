import 'package:get/get.dart';

class FoodDrinkController extends GetxController {
  var selected = 'Food'.obs;
  var selectedItem = 'Breakfast'.obs;
  var selectedMealType = 'Breakfast'.obs;

  final List<String> drinkList = [
    'Water',
    'Tea',
    'Juice',
    'Smoothie',
    'Hot Chocolate',
  ];

  final Map<String, RxBool> dropDownStates = {};

  @override
  void onInit() {
    super.onInit();
    initializeDropDownStates(drinkList);
  }

  void initializeDropDownStates(List<String> drinks) {
    for (var drink in drinks) {
      dropDownStates[drink] = false.obs; // ⛔ CLOSED by default
    }
  }

  void toggleDropDown(String item) {
    if (!dropDownStates.containsKey(item)) {
      dropDownStates[item] = true.obs;
    } else {
      dropDownStates[item]!.toggle();
    }
    print("Toggled $item: ${dropDownStates[item]?.value}");
  }

  void select(String value) {
    selected.value = value;
  }

  void selectItem(String value) {
    selectedItem.value = value;
  }

  void selectMealType(String value) {
    selectedMealType.value = value;
  }
}
