import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/routes/app_routes.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';

class TrackSymptoms extends StatelessWidget {
  final List<TrackItem> trackItems = [
    TrackItem(
        icon: Assets.symptomsIcon,
        title: 'Symptoms',
        subtitle: 'Track your hormonal health symptoms',

    ),
    TrackItem(
        icon: Assets.unfilledHeart,
        title: 'Mood',
        subtitle: 'Monitor your emotional wellbeing',),
    TrackItem(
        icon: Assets.sleepIcon,
        title: 'Sleep',
        subtitle: 'Track your sleep patterns',),
    TrackItem(
        icon: Assets.foodDrinkIcon,
        title: 'Food & Drink',
        subtitle: 'Track your diet and liquid intake',),
    TrackItem(
        icon: Assets.dumbellIcon,
        title: 'Exercise',
        subtitle: 'Log your physical activity',),
    TrackItem(icon: Assets.hrtIcon, title: 'joint Pain', subtitle: 'aching',),
    TrackItem(
        icon: Assets.hrtIcon,
        title: 'HRT',
        subtitle: 'Track your harmone therapy',),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Suppliments',
        subtitle: 'Track your suppliments and vitamins',),
    // TrackItem(
    //     icon: Assets.supplimentsIcon,
    //     title: 'Periods',
    //     subtitle: 'Sweating at night'),
    TrackItem(
        icon: Assets.periodsIcon,
        title: 'Periods',
        subtitle: 'Track your menstrual cyclesss',),
  ];

  TrackSymptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [

                  ColorConstants.gradient1.withAlpha((0.5*255).toInt()),
                  ColorConstants.gradient2.withAlpha((0.5*255).toInt()),
                  Colors.transparent,
                ]),
          ),
        ),
        Scaffold(
backgroundColor: ColorConstants.transparentColor,

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
                            if(index==0){Get.toNamed(AppRoutes.trackView);}
                            if(index==1){Get.toNamed(AppRoutes.moodTrackerView);}
                            if(index==2){Get.toNamed(AppRoutes.sleepView);}
                            if(index==3){Get.toNamed(AppRoutes.foodAndDrinkOrder);}
                            if(index==4){Get.toNamed(AppRoutes.exerciseTrackerView);}
                            if(index==6){Get.toNamed(AppRoutes.hrtTracker);}
                            if(index==7){Get.toNamed(AppRoutes.supplementTracker);}
                            if(index==8){Get.toNamed(AppRoutes.periodTrackerView);}
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
                                      Texts.textMedium(item.title, size: 15),
            
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
        ),
      ],
    );
  }
}
