import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/controller.dart';

class SymptomsView extends StatefulWidget {
  const SymptomsView({super.key});

  @override
  State<SymptomsView> createState() => _SymptomsViewState();
}

class _SymptomsViewState extends State<SymptomsView> {
  final SymptomsController controller = Get.put(SymptomsController());


  final List<TrackItem> trackItems = [
    TrackItem(
        icon: Assets.symptomsIcon,
        title: 'Anxiety',
        subtitle: 'Track your hormonal health symptoms',

    ),
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
        subtitle: 'Emotional ups and downs'),
    TrackItem(
        icon: Assets.dumbellIcon,
        title: 'Fatigue',
        subtitle: 'Constant Tiredness',subtitle2: "",),
    TrackItem(icon: Assets.hrtIcon, title: 'joint Pain', subtitle: 'Aching or stiff joints'),
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
                          SeveritySlider(labels: ["None","Mild",'Moderate',"Severe","Very Severe"],),

                          Widgets.heightSpaceH2,
                          Texts.textBold("Related Triggers",size: 16),
                          Widgets.heightSpaceH1,
                          Texts.textNormal('Life Style',textAlign: TextAlign.start,size: 12),
                          Widgets.heightSpaceH05,


                        Wrap(
                        children: List.generate(lifeStyleList.length, (index) {
                        final label = lifeStyleList[index];
                        final sectionKey = "${item.title}_LifeStyle";

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
                              final sectionKey = "${item.title}_Environmental";


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
                              final sectionKey = "${item.title}_Dietary";


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
                              final sectionKey = "${item.title}_Stress";


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
                          CustomButton(
                            backgroundColor: ColorConstants.darkPrimaryColor,
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
                Widgets.heightSpaceH1,
                EntryField(hint: "Enter your Symptom",maxLines:1),
                Widgets.heightSpaceH05,
                EntryBigField(hint: "Describe the Symptom",),

                SeveritySlider(labels: ["None","Mild","Moderate","Severe","Very Severe"],),

                Widgets.heightSpaceH2,
                Texts.textBold("Related Triggers",size: 16),
                Widgets.heightSpaceH1,
                Texts.textNormal('Life Style',textAlign: TextAlign.start,size: 12),
                Widgets.heightSpaceH05,




                Wrap(
                  direction:Axis.horizontal,
                  children: List.generate( lifeStyleList.length, (index){
                    final label = lifeStyleList[index];
                    final sectionKey = "${label}Life Style'";


                    return Padding(
                      padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
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
                    final sectionKey = "${label}Environmental.";


                    return Padding(
                      padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
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
                    final sectionKey = "${label}Dietary.";


                    return Padding(
                      padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
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
                    final sectionKey = "${label}Stress..";


                    return Padding(
                      padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
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
                CustomButton(
                  backgroundColor: ColorConstants.darkPrimaryColor,
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











