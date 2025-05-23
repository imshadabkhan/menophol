import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_slider.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class Exercise extends StatelessWidget {
   Exercise({super.key});
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
            Texts.textBold('Activity Type',size: 20),
            Widgets.heightSpaceH05,
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                  itemCount: activityType.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(BuildContext context,int index){
        
                    return HorizontalListButtons(activityType: activityType,index: index,);
        
                  }),
            ),
            Widgets.heightSpaceH1,
            Texts.textBold('Activity',size: 18),
            Widgets.heightSpaceH1,
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: activityList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0, // Space between columns
                  mainAxisSpacing: 10.0, // Space between rows
                  childAspectRatio: 3.5,
        
                ), itemBuilder: (BuildContext context,index){
              return Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.greyBorderColor),
                  color: ColorConstants.whiteColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),child: Texts.textMedium(activityList[index],size: 14,color: ColorConstants.grayColor),),);
        
        
            }),
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
            SeveritySlider(),
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

class HorizontalListButtons extends StatelessWidget {
  const HorizontalListButtons({
    super.key,
    required this.activityType,
    required this.index

  });

  final List<String> activityType;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(left: 0,right: 5),
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        decoration: BoxDecoration(
          color: ColorConstants.darkPrimaryColor,
          borderRadius: BorderRadius.circular(8),



        ),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Texts.textMedium(activityType[index],color: ColorConstants.whiteColor,size: 14
        ),


      ),
      )
    );
  }
}
