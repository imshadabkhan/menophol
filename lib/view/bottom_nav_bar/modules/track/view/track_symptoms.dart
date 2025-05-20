import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/food_and_drink/food_and_drink.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/mood_tracker_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/sleep_tracker/sleep_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/track_view.dart';

class TrackSymptoms extends StatelessWidget {
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

  TrackSymptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texts.textBold("Track", size: 22),
              Widgets.heightSpaceH05,
              Texts.textNormal(
                  'Track your symptoms, sleep, mood, and more to uncover patterns, gain insights, and take back control of your health.',
                  size: 16,
                  textAlign: TextAlign.start),
              Widgets.heightSpaceH2,
              Texts.textBold('What would you like to track today?', size: 24),
              Widgets.heightSpaceH1,
              Expanded(
                child: ListView.separated(
                  itemCount: trackItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = trackItems[index];
                    return InkWell(
                      onTap: (){
                        Get.to(TrackView());
                        if(index==1){Get.to(MoodTrackerView());}
                        if(index==2){Get.to(SleepView());}
                        if(index==3){Get.to(FoodAndDrinkOrder());}

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
                                color: Colors.pink.shade50,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 12),
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
                                  Texts.textBold(item.title, size: 22),
                                  Widgets.heightSpaceH05,
                                  Texts.textNormal(item.subtitle,
                                      size: 16, textAlign: TextAlign.start),
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
