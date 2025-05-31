import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/controller.dart';

import '../../../../../../core/widgets/entry_field.dart';
import '../../../../../../core/widgets/widgets.dart';

class MoodView extends StatefulWidget {
  const MoodView({super.key});

  @override
  State<MoodView> createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  final MoodController controller = Get.put(MoodController());

  final List<String> moodList = [
    'Happy',
    "Sad",
    'Anxious',
    "Irritable",
    "Energetic",
    "Tired",
    'Calm',
    "Confused",
    "Motivated",
    "Overwhelmed"
  ];

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> environmentalList = ['Temperature', 'Weather Changes'];
  final List<String> dietaryList = ['caffeine', 'Alcohol', 'Spicy Food'];
  final List<String> stressList = ['Work Stress', 'Emotional Stress'];
  final List<String> lifeStyleList = ['Exercise', 'Sleep Changes'];

  final List<String> iconList = [
    Assets.unfilledHappy,
    Assets.unfilledSad,
    Assets.unfilledUnaxious,
    Assets.unfilledIrritable,
    Assets.unfilledEnergetic,
    Assets.unfilledTired,
    Assets.unfilledCalm, Assets.unfilledConfused, Assets.unfilledEnergetic, Assets.unfilledOverwhelmed,


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Widgets.heightSpaceH1,
              EntryField(
                prefixIcon: Assets.calendarIcon,
                hint: "07/04/2025",
              ),
              Widgets.heightSpaceH1,
              Obx(()=> CustomDropdown(
                onTap: () {
                  controller.toggleDropDown();
                },
                value: 'Related Triggers(0)',
                hint: null,
                label: null,
valueColor: controller.dropDown.value
    ? ColorConstants.whiteColor
    : ColorConstants.blackColor ,
                color: controller.dropDown.value
                    ? ColorConstants.darkPrimaryColor
                    : ColorConstants.whiteColor,
                iconColor: controller.dropDown.value
                    ? ColorConstants.whiteColor:ColorConstants.blackColor,
                suffixIcon:  controller.dropDown.value?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_rounded

              ),),

              Obx(() => controller.dropDown.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.whiteColor,
                        border:
                            Border.all(color: ColorConstants.greyBorderColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texts.textNormal('Life Style',textAlign: TextAlign.start,size: 12),

                            Wrap(
                              children: List.generate(lifeStyleList.length, (index) {
                                final label = lifeStyleList[index];
                                final sectionKey = "${label}_LifeStyle";

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(() => RadioBtnWithTextChip(
                                    label: label,
                                    isSelected: controller.isSelected(sectionKey, label),
                                    onTap: () => controller.toggleTrigger(sectionKey, label),
                                  )),
                                );
                              }),
                            ),


                            Widgets.heightSpaceH1,
                            Texts.textNormal('Environmental',textAlign: TextAlign.start,size: 12),

                            Wrap(
                              direction:Axis.horizontal,
                              children: List.generate( environmentalList.length, (index){
                                final label = lifeStyleList[index];
                                final sectionKey = "${label}_Environmental";


                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(() => RadioBtnWithTextChip(
                                    label: label,
                                    isSelected: controller.isSelected(sectionKey, label),
                                    onTap: () => controller.toggleTrigger(sectionKey, label),
                                  )),                            );}),),
                            Widgets.heightSpaceH1,
                            Texts.textNormal('Dietary',textAlign: TextAlign.start,size: 12),



                            Wrap(
                              direction:Axis.horizontal,
                              children: List.generate( dietaryList.length, (index){
                                final label = dietaryList[index];
                                final sectionKey = "${label}_Dietary";


                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(() => RadioBtnWithTextChip(
                                    label: label,
                                    isSelected: controller.isSelected(sectionKey, label),
                                    onTap: () => controller.toggleTrigger(sectionKey, label),
                                  )),                            );}),),



                            Widgets.heightSpaceH1,
                            Texts.textNormal('Stress',textAlign: TextAlign.start,size: 12),




                            Wrap(
                              direction:Axis.horizontal,
                              children: List.generate( stressList.length, (index){
                                final label = stressList[index];
                                final sectionKey = "${label}_Stress";


                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(() => RadioBtnWithTextChip(
                                    label: label,
                                    isSelected: controller.isSelected(sectionKey, label),
                                    onTap: () => controller.toggleTrigger(sectionKey, label),
                                  )),                            );}),),



                            Widgets.heightSpaceH1,
                            Texts.textNormal('Custom Triggers',
                                textAlign: TextAlign.start, size: 12),
                            Widgets.heightSpaceH05,
                            Row(
                              children: [
                                Expanded(
                                    child: EntryField(
                                  fillColor: ColorConstants.lightGray,
                                  hint: "Enter custom trigger",
                                  borderRadius: BorderRadius.circular(4),
                                )),
                                Widgets.widthSpaceW3,
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container()),
              Widgets.heightSpaceH2,
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: moodList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => controller.selectMood(index),
                    child: Obx(() {
                      bool isSelected = controller.selectedIndex.value == index;

                      return Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorConstants.primaryColor
                                  .withAlpha((0.5 * 255).toInt())
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected
                                ? ColorConstants.darkPrimaryColor
                                : ColorConstants.greyBorderColor,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(iconList[index],
                                height: 30.h, width: 30.w),
                            SizedBox(height: 8),
                            Texts.textNormal(
                              moodList[index],
                              size: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.darkPrimaryColor,
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              Widgets.heightSpaceH3,
              Texts.textBold('Current Mood',
                  size: 18, textAlign: TextAlign.start),
              Widgets.heightSpaceH1,
              EntryField(

                hint: "Enter your mood",
              ),
              Widgets.heightSpaceH05,
              EntryBigField(
                hint: "Describe your feeling",
              ),
              Widgets.heightSpaceH1,
              CustomButton(
                label: "Add custom mood",
                textColor: ColorConstants.blackColor,
                borderColor: ColorConstants.blackColor,
                borderWidth: 1.0,
              ),
              Widgets.heightSpaceH2,
              CustomButton(
                label: "Save mood",
                textColor: ColorConstants.whiteColor,
                backgroundColor: ColorConstants.darkPrimaryColor,
              ),
              Widgets.heightSpaceH1,
            ],
          ),
        ),
      ),
    );
  }
}
