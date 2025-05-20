import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';

import '../../../../../../core/widgets/entry_field.dart';
import '../../../../../../core/widgets/widgets.dart';

class MoodView extends StatefulWidget {
  const MoodView({super.key});

  @override
  State<MoodView> createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  final List<String> moodList=[
    'Happy',"Sad",'Anxious',"Irritable","Energetic","Tired",'Calm',"Confused","Motivated","Overwhelmed"

  ];


  final List<String> iconList=[
    Assets.unfilledHappy,Assets.unfilledSad,Assets.unfilledUnaxious,Assets.unfilledIrritable,Assets.unfilledIrritable,Assets.unfilledEnergetic,Assets.unfilledTired,Assets.unfilledCalm,Assets.unfilledConfused,Assets.unfilledEnergetic,Assets.unfilledOverwhelmed

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            EntryField(
              prefixIcon: Assets.calendarIcon,
              hint: "07/04/2025",
            ),
            Widgets.heightSpaceH05,
            EntryField(

            ),
            Widgets.heightSpaceH1,
          
            GridView.builder(
            shrinkWrap: true,
              physics:NeverScrollableScrollPhysics(),
                            itemCount: moodList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2
            
            
            ), itemBuilder: (BuildContext context,int index){
            
                return Container(
               
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: ColorConstants.greyBorderColor
                  ),
            
                ),
            
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(iconList[index],height: 30.h,width: 30.w,),
                    SizedBox(height: 8),
                    Texts.textNormal(
                      moodList[index],
                      size: 14, fontWeight: FontWeight.bold,color: ColorConstants.darkPrimaryColor),

                  ],
                ),);
            
            
            }),
              Widgets.heightSpaceH2,
              Texts.textBold('Current Mood',size: 18,textAlign: TextAlign.start),
              Widgets.heightSpaceH1,
              EntryField(
                prefixIcon: Assets.calendarIcon,
                hint: "Enter your mood",
              ),
              Widgets.heightSpaceH05,
              EntryField(

                hint: "Describe your feeling",
              ),
              Widgets.heightSpaceH05,
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
              Widgets.heightSpaceH2,
          
          
          
            ],),
        ),
      ),

    );
  }
}
