import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/exercise.dart';

class MedicationDatabase extends StatelessWidget {
   MedicationDatabase({super.key});
  final List<String> btnLabels = [
    'Formatted Text',
    "CSV format",
    "JSON format"
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Widgets.heightSpaceH05,
            Texts.textBold('HRT Medication Data', size: 20),
            Widgets.heightSpaceH05,
            SizedBox(
              height: 50.h, // Adjust height to your button's height
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: btnLabels.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (BuildContext context, int index) {
                  return HorizontalListButtons(activityType: btnLabels,index: index,);
                },
              ),
            ),
            Widgets.heightSpaceH1,
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),

              ),

            ),
            Widgets.heightSpaceH2,
            Row(children: [
              Expanded(
                child: CustomButton(
                  radius: 4,
                  label: "Copy to clipboard",
                  borderColor: ColorConstants.blackColor,
                  textColor: ColorConstants.blackColor,

                ),
              ),
              Widgets.widthSpaceW3,
              Expanded(
                child: CustomButton(
                  radius: 4,
                  label: "Download as text",
                  backgroundColor:ColorConstants.darkPrimaryColor ,

                ),
              ),


            ],),
          ],
        ),
      ),

    );
  }
}
