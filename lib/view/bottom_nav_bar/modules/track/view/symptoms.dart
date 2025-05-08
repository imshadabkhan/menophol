import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_expansion_tile.dart';
import 'package:menophol/core/widgets/custom_slider.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/expandable_list_tile.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';

class SymptomsView extends StatefulWidget {
  const SymptomsView({super.key});

  @override
  State<SymptomsView> createState() => _SymptomsViewState();
}

class _SymptomsViewState extends State<SymptomsView> {

  final List<TrackItem> trackItems = [
    TrackItem(
        icon: Assets.symptomsIcon,
        title: 'Anxiety',
        subtitle: 'Track your hormonal health symptoms'),
    TrackItem(
        icon: Assets.unfilledHeart,
        title: 'Brain Fog',
        subtitle: 'Monitor your emotional wellbeing'),
    TrackItem(
        icon: Assets.sleepIcon,
        title: 'Sleep Issues',
        subtitle: 'Track your sleep patterns'),
    TrackItem(
        icon: Assets.foodDrinkIcon,
        title: 'Mood Swings',
        subtitle: 'Track your diet and liquid intake'),
    TrackItem(
        icon: Assets.dumbellIcon,
        title: 'Fatigue',
        subtitle: 'Log your physical activity'),
    TrackItem(icon: Assets.hrtIcon, title: 'joint Pain', subtitle: 'aching'),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Weight Gain',
        subtitle: 'Increased Weight gain'),
    TrackItem(
        icon: Assets.periodsIcon,
        title: 'Hot Flushes',
        subtitle: 'Sudden heat and sweating'),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Night Sweats',
        subtitle: 'Sweating at night'),
    TrackItem(
        icon: Assets.periodsIcon,
        title: 'Irregualr Periods',
        subtitle: 'Irregular menstrual cycles'),
  ];
  bool _isExpanded = false;
  String selectedOption = 'Option 1';
  String selectedValue = 'Option 1';
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> environmentalList = ['Temperature', 'Weather Changes'];
  final List<String> dietaryList = ['caffeine', 'Alcohol', 'Spicy Food'];
  final List<String> stressList = ['Work Stress', 'Emotional Stress'];
  final List<String> lifeStyleList = ['Exercise', 'Sleep Changes'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              EntryField(
                prefixIcon: Assets.calendarIcon,
                hint: "07/04/2025",
              ),
              Widgets.heightSpaceH05,
              EntryField(
                prefixIcon: Assets.searchIcon,
                hint: "Search Symptoms",
              ),
              Widgets.heightSpaceH1,
              CustomExpansionTile(
                title: 'Top 10 Symptoms',

                children: [
                  SizedBox(
                    height: 300.h,
                    child: ListView.separated(
                      itemCount: trackItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 2),
                      itemBuilder: (context, index) {
                        final item = trackItems[index];
                        return ExpandableListTile(item: item,children: [
                          SeveritySlider(),

                          Widgets.heightSpaceH2,
                          Texts.textBold("Related Triggers",size: 22),
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
                          CustomButton(
                            backgroundColor: ColorConstants.primaryColor,
                            label: 'Save rating',

                          ),



                        ],);
                      },
                    ),
                  ),
                ],
              ),
              CustomExpansionTile(title: "Vasomotors Symptoms",children: [],),
              CustomExpansionTile(title: "Physical Health & Appearance",children: [],),
              CustomExpansionTile(title: "Cognitive & Mood Changes",children: [],),
              CustomExpansionTile(title: "Harmonal & Menstrual Health",children: [],),
              CustomExpansionTile(title: "Custom Symptom",children: [
                EntryField(hint: "Enter your Symptom",maxLines:1),
                Widgets.heightSpaceH05,
                EntryField(hint: "Describe the Symptom",maxLines: 2,height: 50,),

                SeveritySlider(),

                Widgets.heightSpaceH2,
                Texts.textBold("Related Triggers",size: 22),
                Widgets.heightSpaceH1,
                Texts.textNormal('Life Style',textAlign: TextAlign.start,size: 16),
                Widgets.heightSpaceH05,
                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
                    child:RadioBtnWithTextChip(label: lifeStyleList[index]),
                  ),),),
                Widgets.heightSpaceH1,
                Texts.textNormal('Environmental',textAlign: TextAlign.start,size: 16),

                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
                    child: RadioBtnWithTextChip(label: environmentalList[index]),
                  ),),),
                Widgets.heightSpaceH1,
                Texts.textNormal('Dietary',textAlign: TextAlign.start,size: 16),

                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
                    child: RadioBtnWithTextChip(label: dietaryList[index]),
                  ),),),

                Widgets.heightSpaceH1,
                Texts.textNormal('Stress',textAlign: TextAlign.start,size: 16),

                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate(2, (index)=> Padding(
                    padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
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
                Widgets.heightSpaceH05,
                CustomButton(
                  backgroundColor: ColorConstants.primaryColor,
                  label: 'Add custom symptoms',

                ),
                Widgets.heightSpaceH05,





              ],),

            ],
          ),
        ),
      ),
    );
  }
}











