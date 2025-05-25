import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_slider.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/horizontal_list_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/controller.dart';

class Exercise extends StatelessWidget {
   Exercise({super.key});
   final ExerciseController controller = Get.put(ExerciseController());
  final List<String> activityType=["Cardio/Aerobic","Strength training"];
   final List<String> activityList=["Walking","Running/jogging","Cycling/Biking","Swimming","Dancing","HIIT","Elliptical","Rowing","Stair Climbing","Jump rope","Kickboxing"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Padding(
      padding: PaddingConstants.screenPaddingHalf,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EntryField(
              prefixIcon: Assets.calendarIcon,
              hint: "07/04/2025",
            ),
            Widgets.heightSpaceH1,
            Texts.textBold('Activity Type',size: 18),
            Widgets.heightSpaceH1,
            SizedBox(
              height: 35.h,
              child: ListView.builder(
                itemCount: activityType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final label = activityType[index];

                  return Obx(() {
                    return HorizontalListButtons(
                      label: label,
                      isSelected: controller.selectedActivityType.value == label,
                      onTap: () => controller.selectActivityType(label),
                    );
                  });
                },
              ),
            ),

            Widgets.heightSpaceH2,
            Texts.textBold('Activity',size: 18),
            Widgets.heightSpaceH1,
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: activityList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                final label = activityList[index];
                return Obx(() {
                  final isSelected = controller.selectedActivity.value == label;
                  return GestureDetector(
                    onTap: () => controller.selectActivity(label),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? ColorConstants.darkPrimaryColor
                              : ColorConstants.greyBorderColor,
                        ),
                        color: isSelected
                            ? ColorConstants.darkPrimaryColor
                            : ColorConstants.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        child: Texts.textMedium(
                          label,
                          size: 14,
                          color: isSelected
                              ? ColorConstants.whiteColor
                              : ColorConstants.grayColor,
                        ),
                      ),
                    ),
                  );
                });
              },
            ),

            Widgets.heightSpaceH2,
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Texts.textMedium("Duration(hours)",size: 14),
                  Widgets.heightSpaceH05,
                  EntryField(
                    height: 35.h,

                  ),
                ],),
              ),
              Widgets.widthSpaceW3,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                  Texts.textMedium("Duration(Minutes)",size: 14),
                  Widgets.heightSpaceH05,
                  EntryField(
                    height: 35.h,
                  ),
                
                ],),
              ),
              
            ],),
            Widgets.heightSpaceH1,
            Texts.textMedium("Intensity",size: 14),
            Widgets.heightSpaceH05,
            SeveritySlider(labels: ["Light","Moderate","Intense"],),
            Widgets.heightSpaceH2,
            CustomButton(
              backgroundColor: ColorConstants.darkPrimaryColor,
              textColor: ColorConstants.whiteColor,
              label: 'Save exercise',
            ),
        
        
          ],
        ),
      ),
    ),);
  }
}



