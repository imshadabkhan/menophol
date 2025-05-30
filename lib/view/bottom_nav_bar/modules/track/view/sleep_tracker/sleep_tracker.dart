import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/custom_slider.dart';

import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/sleep_tracker/controller.dart';

import '../../../../../../core/widgets/entry_field.dart';
import '../../../../../../core/widgets/widgets.dart';

class SleepTracker extends StatefulWidget {
  const SleepTracker({super.key});

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {

  SleepTrackerController controller=Get.put(SleepTrackerController());

  final List<TrackItem> trackItems = [
    TrackItem(
        icon: Assets.symptomsIcon,
        title: 'Symptoms',
        subtitle: 'Track your hormonal health symptoms',subtitle2: "",),
    TrackItem(
        icon: Assets.unfilledHeart,
        title: 'Mood',
        subtitle: 'Monitor your emotional wellbeing',subtitle2: "",),
    TrackItem(
        icon: Assets.sleepIcon,
        title: 'Sleep',
        subtitle: 'Track your sleep patterns',subtitle2: "",),
    TrackItem(
        icon: Assets.foodDrinkIcon,
        title: 'Food & Drink',
        subtitle: 'Track your diet and liquid intake',subtitle2: "",),
    TrackItem(
        icon: Assets.dumbellIcon,
        title: 'Exercise',
        subtitle: 'Log your physical activity',subtitle2: "",),
    TrackItem(icon: Assets.hrtIcon, title: 'joint Pain', subtitle: 'aching',subtitle2: "",),
    TrackItem(
        icon: Assets.hrtIcon,
        title: 'HRT',
        subtitle: 'Increased Weight gain',subtitle2: "",),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Suppliments',
        subtitle: 'Sudden heat and sweating',subtitle2: "",),
    // TrackItem(
    //     icon: Assets.supplimentsIcon,
    //     title: 'Periods',
    //     subtitle: 'Sweating at night'),
    TrackItem(
        icon: Assets.periodsIcon,
        title: 'Irregualr Periods',
        subtitle: 'Irregular menstrual cycles',subtitle2: "",),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
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
                    child: Image.asset(Assets.sleepQuality,height: 20.h,width: 20.w,)),
               Widgets.widthSpaceW1,
               Baseline(baseline: 25, baselineType:TextBaseline.alphabetic,child:  Texts.textBold("Sleep Quality (1 - 10)",size: 18),),


              ],),
              Widgets.heightSpaceH1,
              SeveritySlider(labels: ["Poor","Fair","Good","Perfect"],),

              Widgets.heightSpaceH2,
              EntryField(
                label: "Duration (hours)",
              ),
              Widgets.heightSpaceH05,
              EntryField(
                label: "Times Awake",

              ),
              Widgets.heightSpaceH05,
              EntryBigField(


                label: "Notes",
                hint: "Add any notes about your sleep..",

              ),
             Obx(()=>CustomDropdown(onTap: (){
               controller.toggleDropDown();

             },valueColor:controller.dropDown.value?ColorConstants.whiteColor:ColorConstants.blackColor , value:"Related Triggers (1) ", hint: null, label:null,color: controller.dropDown.value?ColorConstants.darkPrimaryColor:ColorConstants.transparentColor,iconColor: controller.dropDown.value?ColorConstants.whiteColor:ColorConstants.blackColor,suffixIcon:controller.dropDown.value?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,),),

          Obx(()=> controller.dropDown.value?Container(
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
                  Texts.textNormal('Life Style',textAlign: TextAlign.start,size: 12),
                  Widgets.heightSpaceH05,


                  Wrap(
                    direction:Axis.horizontal,
                    children: List.generate( lifeStyleList.length, (index){
                      final label = lifeStyleList[index];
                      final sectionKey = "${label}lifeStyleList";


                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => RadioBtnWithTextChip(
                          label: label,
                          isSelected: controller.isSelected(sectionKey, label),
                          onTap: () => controller.toggleTrigger(sectionKey, label),
                        )),                            );}),),



                  Widgets.heightSpaceH1,
                  Texts.textNormal('Environmental',textAlign: TextAlign.start,size: 12),




                  Wrap(
                    direction:Axis.horizontal,
                    children: List.generate( environmentalList.length, (index){
                      final label = environmentalList[index];
                      final sectionKey = "${label}environmentalList";


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
                      final sectionKey = "${label}dietaryList";


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
                      final sectionKey = "${label}stressList";


                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => RadioBtnWithTextChip(
                          label: label,
                          isSelected: controller.isSelected(sectionKey, label),
                          onTap: () => controller.toggleTrigger(sectionKey, label),
                        )),                            );}),),

                  Widgets.heightSpaceH1,
                  Texts.textNormal('Custom Triggers',textAlign: TextAlign.start,size: 12),
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
          ):Container()),



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
