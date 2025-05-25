import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/dynamic_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobtn_withtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/food_and_drink/controller/controller.dart';

class Track extends StatelessWidget {
  Track({super.key});
  final FoodDrinkController controller = Get.put(FoodDrinkController());

  final List<String> foodList = const ["Breakfast", 'Main meals', 'Spicy food'];
  final List<String> mealList = const [
    'Cereal',
    'Eggs',
    'Toast/Breads',
    'Pancakes',
    'Smoothies',
    'Pastries',
    'Yogurt'
  ];
  final List<String> drinkList = const [
    'Water',
    'Tea',
    'juice',
    'Smoothie',
    'Hot Chocolate',
  ];
  final List<String> foodOptions = const [
    "Breakfast",
    'Main meals',
    'Spicy food'
  ];
  final List<String> drinkOptions = const ["Alcoholic", "Non-Alcoholic"];

  final List<String> foodType = const ["Breakfast", 'Lunch', 'Dinner', "Snack"];

  @override
  Widget build(BuildContext context) {
    controller.initializeDropDownStates(drinkList);

    return Scaffold(
      body: Padding(
          padding: PaddingConstants.screenPaddingHalf.copyWith(bottom: 5),
          child: ListView(

            children: [
              EntryField(
                prefixIcon: Assets.calendarIcon,
                hint: "07/04/2025",
              ),
              Widgets.heightSpaceH05,
              Obx(() => Row(
                    children: [
                      DynamicButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                        bgColor: controller.selected.value == 'Food'
                            ? ColorConstants.darkPrimaryColor
                            : ColorConstants.transparentColor,
                        borderColor: controller.selected.value == 'Food'
                            ? ColorConstants.transparentColor
                            : ColorConstants.blackColor,
                        title: "Food",
                        textColor: controller.selected.value == 'Food'
                            ? ColorConstants.whiteColor
                            : ColorConstants.blackColor,
                        onTap: () => controller.select('Food'),
                        size: 14.0,
                      ),
                      Widgets.widthSpaceW2,
                      DynamicButton(
                        size: 14.0,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        bgColor: controller.selected.value == 'Drink'
                            ? ColorConstants.darkPrimaryColor
                            : ColorConstants.transparentColor,
                        borderColor: controller.selected.value == 'Drink'?ColorConstants.transparentColor: ColorConstants.blackColor,
                        title: "Drink",
                        textColor: controller.selected.value == 'Drink'
                            ? ColorConstants.whiteColor
                            : ColorConstants.blackColor,
                        onTap: () => controller.select('Drink'),
                      ),
                    ],
                  )),
              Widgets.heightSpaceH2,
              Texts.textBold("Meal Type",
                  textAlign: TextAlign.start, size: 18.sp),
              Widgets.heightSpaceH05,
              Obx(() => Row(
                    children: List.generate(
                      foodType.length,
                      (int index) {
                        final label = foodType[index];
                        final isSelected =
                            controller.selectedMealType.value == label;

                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CustomRadioWithText(
                            label: label,
                            onTap: () => controller.selectMealType(label),
                            isSelected: isSelected,
                          ),
                        );
                      },
                    ),
                  )),
              Widgets.heightSpaceH1,
              EntrySearchField(
                prefixIcon: Assets.searchbarIcon,
                hint: "Search for food or drink",
              ),
              SizedBox(
                height: 40.h,
                child: Obx(() {
                  final selectedItem = controller.selectedItem.value;
                  final isDrink = controller.selected.value == 'Drink';

                  final List<String> options =
                      isDrink ? drinkOptions : foodOptions;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final label = options[index];
                      final isSelected = selectedItem == label;

                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: DynamicButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          size: 16.0,
                          onTap: () => controller.selectItem(label),
                          title: label,
                          bgColor: isSelected
                              ? ColorConstants.darkPrimaryColor
                              : ColorConstants.transparentColor,
                          textColor: isSelected
                              ? ColorConstants.whiteColor
                              : ColorConstants.blackColor,
                          borderColor: isSelected
                              ? ColorConstants.transparentColor
                              : ColorConstants.blackColor,
                        ),
                      );
                    },
                  );
                }),
              ),
              Widgets.heightSpaceH05,
              Widgets.divider(),
              Widgets.heightSpaceH2,
              Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.selected.value == 'Food'
                        ? mealList.length
                        : drinkList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return controller.selected.value == 'Food'
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: MealBoxWidget(title: mealList[index]),
                            )
                          : Column(
                              children: [
                                CustomDropdown(
                                  onTap: () {
                                    controller.toggleDropDown(drinkList[index]);
                                  },
                                  value: drinkList[index],
                                  hint: '',
                                  label: drinkList[index],
                                  color: ColorConstants.transparentColor,
                                  borderColor: ColorConstants.blackColor,
                                  prefixIcon: Assets.drinkIcon,
                                  iconColor: ColorConstants.blackColor,
                                ),
                                Widgets.heightSpaceH05,
                                Obx(
                                  () => controller.dropDownStates[drinkList[index]]?.value ?? false
                                      ? Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                          ColorConstants.blackColor,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 8.0),
                                            child: Row(
                                              crossAxisAlignment:CrossAxisAlignment.end,
                                              children: [
                                                Image.asset(
                                                  Assets.drinkIcon,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Widgets.widthSpaceW1,
                                                Texts.textNormal("Tea",
                                                    size: 14),
                                                Expanded(
                                                    child: Widgets
                                                        .widthSpaceW05),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: Colors.black,
                                                  size: 18,
                                                )
                                              ],
                                            ),
                                          ),
                                          Widgets.divider(),
                                          Widgets.heightSpaceH1,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: EntryField(
                                                      hint:
                                                      "Enter Amount",
                                                    )),
                                                Widgets.widthSpaceW2,
                                                Flexible(
                                                    child: EntryField(
                                                      hint: "ml",
                                                    )),
                                                Widgets.widthSpaceW2,
                                                Expanded(
                                                    child: CustomButton(
                                                      label: "Add",
                                                      textColor:
                                                      ColorConstants
                                                          .whiteColor,
                                                      backgroundColor:
                                                      ColorConstants
                                                          .darkPrimaryColor,
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            );
                    },
                  )),
              Widgets.heightSpaceH05,
              Widgets.divider(),
              Widgets.heightSpaceH1,
              Obx(
                () => controller.selected.value == 'Food'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Texts.textMedium('Add Custom Food', size: 16),
                          Widgets.heightSpaceH05,
                          Row(
                            children: [
                              Expanded(
                                child: EntryField(
                                  hint: "Enter custom food",
                                ),
                              ),
                              Widgets.widthSpaceW3,
                              CustomButton(
                                label: "Add",
                                width: 60.w,
                                height: 40.h,
                                backgroundColor: ColorConstants.blackColor,
                              ),
                            ],
                          ),
                          Widgets.heightSpaceH1,
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Texts.textMedium('Add Custom Drink', size: 16),
                          Widgets.heightSpaceH05,
                          EntryField(
                            hint: "Enter custom drink",
                          ),
                          Widgets.heightSpaceH05,
                          EntryField(
                            hint: "Amount",
                          ),
                          Widgets.heightSpaceH1,
                          CustomButton(
                            backgroundColor: ColorConstants.darkPrimaryColor,
                            label: "Add custom drink",
                          ),
                          Widgets.heightSpaceH1,
                        ],
                      ),
              )
            ],
          )),
    );
  }
}

class MealBoxWidget extends StatelessWidget {
  const MealBoxWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorConstants.blackColor,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              Assets.forkKnifeIcon,
              width: 20,
              height: 20,
            ),
            Widgets.widthSpaceW2,
            Texts.textMedium(title, size: 15),
            Expanded(child: Widgets.widthSpaceW1),
            Icon(
              Icons.add,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
