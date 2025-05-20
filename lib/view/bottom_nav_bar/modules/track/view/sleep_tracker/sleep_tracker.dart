import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/custom_slider.dart';
import 'package:menophol/core/widgets/expandable_list_tile.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';

import '../../../../../../core/widgets/entry_field.dart';
import '../../../../../../core/widgets/widgets.dart';

class SleepTracker extends StatefulWidget {
  const SleepTracker({super.key});

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {
  final List<TrackItem> trackItems = [
    TrackItem(
        icon: Assets.symptomsIcon,
        title: 'Symptoms',
        subtitle: 'Track your hormonal health symptoms'),
    TrackItem(
        icon: Assets.unfilledHeart,
        title: 'Mood',
        subtitle: 'Monitor your emotional wellbeing'),
    TrackItem(
        icon: Assets.sleepIcon,
        title: 'Sleep',
        subtitle: 'Track your sleep patterns'),
    TrackItem(
        icon: Assets.foodDrinkIcon,
        title: 'Food & Drink',
        subtitle: 'Track your diet and liquid intake'),
    TrackItem(
        icon: Assets.dumbellIcon,
        title: 'Exercise',
        subtitle: 'Log your physical activity'),
    TrackItem(icon: Assets.hrtIcon, title: 'joint Pain', subtitle: 'aching'),
    TrackItem(
        icon: Assets.hrtIcon,
        title: 'HRT',
        subtitle: 'Increased Weight gain'),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Suppliments',
        subtitle: 'Sudden heat and sweating'),
    // TrackItem(
    //     icon: Assets.supplimentsIcon,
    //     title: 'Periods',
    //     subtitle: 'Sweating at night'),
    TrackItem(
        icon: Assets.periodsIcon,
        title: 'Irregualr Periods',
        subtitle: 'Irregular menstrual cycles'),
  ];

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> environmentalList = ['Temperature', 'Weather Changes'];
  final List<String> dietaryList = ['caffeine', 'Alcohol', 'Spicy Food'];
  final List<String> stressList = ['Work Stress', 'Emotional Stress'];
  final List<String> lifeStyleList = ['Exercise', 'Sleep Changes'];
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

              Widgets.heightSpaceH1,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Baseline(
                  baseline: 30,
                    baselineType: TextBaseline.alphabetic,
                    child: Image.asset(Assets.sleepQuality,height: 25.h,width: 25.w,)),
               Widgets.widthSpaceW1,
               Baseline(baseline: 25, baselineType:TextBaseline.alphabetic,child:  Texts.textBold("Sleep Quality (1 - 10)",size: 20),),


              ],),
              Widgets.heightSpaceH1,
              SeveritySlider(),

              Widgets.heightSpaceH1,
              EntryField(
                prefixIcon: Assets.calendarIcon,
                hint: "Enter your mood",
                label: "Duration (hours)",
              ),
              Widgets.heightSpaceH05,
              EntryField(
                label: "Times Awake",
                hint: "Describe your feeling",
              ),
              Widgets.heightSpaceH05,
              EntryField(


                label: "Notes",
                hint: "Add any notes about your sleep..",

              ),
              // CustomDropdown(onTap: (){}, value: "Related Triggers", hint: "", label: '',),
CustomDropdown(onTap: (){}, value:"Related Triggers (1) ", hint: "", label: ""),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.greyBorderColor),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                Widgets.heightSpaceH1,
                Texts.textNormal('Life Style',textAlign: TextAlign.start,size: 16),
                Widgets.heightSpaceH05,
                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:RadioBtnWithTextChip(label: lifeStyleList[index]),
                  ),),),
                Widgets.heightSpaceH1,
                Texts.textNormal('Environmental',textAlign: TextAlign.start,size: 16),

                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RadioBtnWithTextChip(label: environmentalList[index]),
                  ),),),
                Widgets.heightSpaceH1,
                Texts.textNormal('Dietary',textAlign: TextAlign.start,size: 16),

                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RadioBtnWithTextChip(label: dietaryList[index]),
                  ),),),

                Widgets.heightSpaceH1,
                Texts.textNormal('Stress',textAlign: TextAlign.start,size: 16),

                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RadioBtnWithTextChip(label: stressList[index]),
                  ),),),

                Widgets.heightSpaceH1,
                Texts.textNormal('Custom Triggers',textAlign: TextAlign.start,size: 16),
                Widgets.heightSpaceH05,

                Row(children: [
                  Expanded(child: EntryField(
                    hint:"Enter custom trigger",
                    borderRadius: BorderRadius.circular(4),)),
                  Widgets.widthSpaceW3,
                  Container(decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),

                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add,color: Colors.white,),
                    ),


                  ),
                ],),
                Widgets.heightSpaceH1,




              ],),
            ),
          ),

              Widgets.heightSpaceH2,
              CustomButton(

                label: "Save sleep log",
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
