import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
class ValidateHomePage extends StatelessWidget {
  final controller = Get.put(ValidateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Texts.textBold("Validate", size: 18),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        final dateRange = controller.currentRange;
        return SingleChildScrollView(
          padding: EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ColorConstants.greyBorderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      FlutterToggleButton(

                        buttonWidth:	90.w,
                        buttonHeight: 35.h,
                        outerContainerColor: ColorConstants.toggleBtnBackgroundColor,

                        borderRadius: 10,
                        buttonTextFontSize: 14,

                        buttonColor: ColorConstants.blackColor,
                        items: ['Last 7 Days', 'Last 14 Days', 'Last 30 Days'],
                        onTap: (index) {
                          controller.changeTab(index);
                        },

                      ),

                      Widgets.heightSpaceH2,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            ColorConstants.gradient1,
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
                                  Texts.textNormal(dateRange, size: 12),
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

              Widgets.heightSpaceH3,

              // Insights Section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    ColorConstants.gradient1,
                    ColorConstants.gradient1,
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
                          Widgets.widthSpaceW1,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texts.textBold("Insights", size: 18),
                              Widgets.heightSpaceH05,
                              Texts.textNormal(dateRange, size: 12),
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

              Widgets.heightSpaceH3,

              CustomButton(
                icon: Image.asset(Assets.generateReportIcon, height: 20),
                label: "Generate report",
                color: Colors.white,
                backgroundColor: ColorConstants.darkPrimaryColor,
              ),

              Widgets.heightSpaceH3,

              SummaryCard(
progressColor: ColorConstants.mildGray,
                icon: Assets.symptomsIcon,
                title: "Symptoms",
                dateRange: dateRange,
                score: 3,
                level: "Mild",
                symptoms: ["Mood Swings","Anxiety","Night Sweats"],
                tags: ["Mild", "Moderate", "Severe","Extreme"],
                color: [ColorConstants.mildGray, ColorConstants.moderateColor, ColorConstants.extremeColor],
              ),

              Widgets.heightSpaceH2,

              SummaryCard(
                progressColor:ColorConstants.severeColor ,
                symptoms: ["Exercise,Sleep Changes","Temperature","Caffeine,Alcohol","Work Stress"],
                icon: Assets.brainIcon,
                title: "Triggers",
                dateRange: dateRange,
                score: 6,
                level: "Lifestyle",
                tags: ["Lifestyle", "Environmental", "Dietary", "Stress"],
                color: [ColorConstants.mildGray, ColorConstants.severeColor, ColorConstants.extremeColor, ColorConstants.moderateColor, ],


              ),

              Widgets.heightSpaceH2,

              RecentSymptomsWidgets(
                colorList: controller.colorList,
                symptomsTitleList: controller.symptomsTitleList,
              ),

              Widgets.heightSpaceH2,

              RecentMoodWidget(
                colorList: controller.colorList,
                moodTitleList: controller.moodTitleList,
              ),
              Widgets.heightSpaceH2,
              SleepPatternWidgets(),
              Widgets.heightSpaceH2,
              SymptomsTrendWidget(),
            ],
          ),
        );
      }),
    );
  }
}
