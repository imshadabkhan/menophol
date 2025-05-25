import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/bullet_point_text_widget.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/recent_symptomsWidgets.dart';
import 'package:menophol/core/widgets/sleep_patterns_widgets.dart';
import 'package:menophol/core/widgets/summary_card.dart';
import 'package:menophol/core/widgets/symptoms_trend_widget.dart';

import 'package:menophol/core/widgets/text_widgets.dart';

import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/validate/controller.dart';

import '../../../../core/widgets/recent_mood_Widget.dart';

import 'package:get/get.dart';

class ValidateHomePage extends StatelessWidget {
  final controller = Get.put(ValidateController());

  final List<Color> colorList = [
    ColorConstants.grayColor,
    ColorConstants.peachColor,
    ColorConstants.darkPeachColor,
    ColorConstants.lightRedColor,
    ColorConstants.darkRedColor
  ];

  final List<String> symptomsTitleList = [
    "Night Sweats",
    "Insomnia",
    "Hot Flushes",
    "Head Aches",
    "Anxiety",
    "Fatigue"
  ];

  final List<String> moodTitleList = [
    "Happy",
    "Anxious",
    "Tired",
    "irritable",
    "Content"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Texts.textBold("Validate", size: 22),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Obx(() {
          final dateRange = controller.currentRange;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Toggle Buttons Section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: ColorConstants.greyBorderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(3, (index) {
                            return ToggleButton(
                              index == 0
                                  ? "Last 7 Days"
                                  : index == 1
                                      ? "Last 14 Days"
                                      : "Last 30 Days",
                              controller.selectedIndex.value == index,
                              onTap: () => controller.changeTab(index),
                            );
                          }),
                        ),
                        Widgets.heightSpaceH2,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              ColorConstants.gradient1,
                              ColorConstants.gradient2
                            ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Texts.textBold("Selected Range:", size: 18),
                                    Widgets.heightSpaceH1,
                                    Texts.textNormal(dateRange, size: 14),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorConstants.darkPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      Assets.navbarIcon2,
                                      color: Colors.white,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Widgets.heightSpaceH2,

                // Insights Section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(colors: [
                      ColorConstants.gradient1,
                      ColorConstants.gradient2,
                    ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: ColorConstants.darkPrimaryColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  Assets.insightIcon,
                                  height: 20,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texts.textBold("Insights", size: 18),
                                Widgets.heightSpaceH05,
                                Texts.textNormal(dateRange, size: 14),
                              ],
                            ),
                          ],
                        ),
                        Widgets.heightSpaceH1,
                        Widgets.divider(),
                        Widgets.heightSpaceH1,
                        BulletPoint(
                            "Your most frequent symptoms were Anxiety and Night Sweats, typically occurring in the morning."),
                        BulletPoint(
                            "Overall symptom intensity was high during this period."),
                        BulletPoint(
                            "Consider tracking your daily activities to identify potential triggers."),
                      ],
                    ),
                  ),
                ),

                Widgets.heightSpaceH2,

                CustomButton(
                  icon: Image.asset(Assets.generateReportIcon, height: 20),
                  label: "Generate report",
                  color: Colors.white,
                  backgroundColor: ColorConstants.darkPrimaryColor,
                ),

                Widgets.heightSpaceH2,

                SummaryCard(
                  icon: Assets.symptomsIcon,
                  title: "Symptoms",
                  dateRange: dateRange,
                  score: 3,
                  level: "Mild",
                  tags: ["Mood Swings", "Anxiety", "Night Sweats"],
                  color: Colors.orange,
                ),

                Widgets.heightSpaceH2,

                SummaryCard(
                  icon: Assets.brainIcon,
                  title: "Triggers",
                  dateRange: dateRange,
                  score: 6,
                  level: "Lifestyle",
                  tags: ["Lifestyle", "Environmental", "Dietary", "Stress"],
                  color: Colors.redAccent,
                ),

                Widgets.heightSpaceH2,

                RecentSymptomsWidgets(
                  colorList: colorList,
                  symptomsTitleList: symptomsTitleList,
                ),

                Widgets.heightSpaceH2,

                RecentMoodWidget(
                  colorList: colorList,
                  moodTitleList: moodTitleList,
                ),

                Widgets.heightSpaceH2,
                SleepPatternWidgets(),

                Widgets.heightSpaceH2,
                SymptomsTrendWidget(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton(this.title, this.isSelected,
      {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? ColorConstants.blackColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),

          ),
          child:Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),child:  Texts.textNormal(
              title,

              color:
              isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              size: 10

          ),),
        ),
      ),
    );
  }
}

