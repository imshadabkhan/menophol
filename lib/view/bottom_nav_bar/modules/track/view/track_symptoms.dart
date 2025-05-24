import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/exercise_tracker_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/food_and_drink/food_and_drink.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/hrt_tracker.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/mood_tracker_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/period_tracker_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/sleep_tracker/sleep_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/supplement_tracker/supplement_tracker.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/track_view.dart';

class TrackSymptoms extends StatelessWidget {
  final List<TrackItem> trackItems = [
    TrackItem(
        icon: Assets.symptomsIcon,
        title: 'Symptoms',
        subtitle: 'Track your hormonal health symptoms',
      subtitle2: "",
    ),
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
        subtitle: 'Track your harmone therapy',subtitle2: "",),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Suppliments',
        subtitle: 'Track your suppliments and vitamins',subtitle2: "",),
    // TrackItem(
    //     icon: Assets.supplimentsIcon,
    //     title: 'Periods',
    //     subtitle: 'Sweating at night'),
    TrackItem(
        icon: Assets.periodsIcon,
        title: 'Periods',
        subtitle: 'Track your menstrual cycles',subtitle2: "",),
  ];

  TrackSymptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: PaddingConstants.screenPaddingHalf.copyWith(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texts.textBold("Track", size: 22),
              Widgets.heightSpaceH05,
              Texts.textNormal(
                  'Track your symptoms, sleep, mood, and more to uncover patterns, gain insights, and take back control of your health.',
                  size: 14,
                  textAlign: TextAlign.start),
              Widgets.heightSpaceH2,
              Texts.textBold('What would you like to track today?', size: 24),
              Widgets.heightSpaceH2,
              Expanded(
                child: ListView.separated(
                  itemCount: trackItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = trackItems[index];
                    return InkWell(
                      onTap: (){
                        if(index==0){Get.to(TrackView());}
                        if(index==1){Get.to(MoodTrackerView());}
                        if(index==2){Get.to(SleepView());}
                        if(index==3){Get.to(FoodAndDrinkOrder());}
                        if(index==4){Get.to(ExerciseTrackerView());}
                        if(index==6){Get.to(HrtTracker());}
                        if(index==7){Get.to(SupplementTracker());}
                        if(index==8){Get.to(PeriodTrackerView());}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: ColorConstants.primaryColor
                                .withAlpha((0.3 * 255).toInt()),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.primaryColor.withAlpha((0.5*255).toInt()),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Image.asset(
                                  item.icon,
                                  height: 32.h,
                                  width: 32.w,
                                ),
                              ),
                            ),
                            Widgets.widthSpaceW2,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Texts.textMedium(item.title, size: 16),

                                  Texts.textNormal(item.subtitle,
                                      size: 14, textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
