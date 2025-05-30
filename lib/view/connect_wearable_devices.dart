import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/icon_text_widget.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ConnectWearableDevicesScreen extends StatelessWidget {
  final List<Map<String, String>> devices = [
    {
      'name': 'Apple Health',
      'desc': 'Connect to Apple Health to import your health data',
      'icon': Assets.appleHealthIcon
    },
    {
      'name': 'Fitbit',
      'desc': 'Import your activity, sleep, and heart rate data from Fitbit',
      'icon': Assets.fitbitIcon
    },
    {
      'name': 'Oura Ring',
      'desc': 'Connect your Oura Ring to track sleep, activity and readiness',
      'icon': Assets.ouraRingIcon
    },
    {
      'name': 'Whoop',
      'desc': 'Import your strain, recovery and sleep data from Whoop',
      'icon': Assets.ouraRingIcon
    },
    {
      'name': 'Garmin',
      'desc': 'Connect your Garmin device to track activity and health metrics',
      'icon': Assets.fitbitIcon
    },
  ];

  final List<String> benefits = [
    'Sleep patterns and quality',
    'Activity levels and exercise',
    'Heart rate variability and stress',
    'Temperature fluctuations'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          color: Colors.white,
        ),
        Container(
          height: 300.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstants.gradient1,
                ColorConstants.gradient2,
                ColorConstants.whiteColor

              ],

            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(

            centerTitle: true,
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            padding: PaddingConstants.screenPaddingHalf.copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.textBold(
                "Connect Wearable Devices",size: 18
                ),
                Widgets.heightSpaceH05,
                Texts.textNormal(
                  'Connect your wearable devices to seamlessly track health data and activity.',
                  size: 14,textAlign: TextAlign.start
                ),
              Widgets.heightSpaceH1,
              Widgets.divider(),
                Widgets.heightSpaceH2,
                Texts.textBold(
                  'Available Devices',size: 18,

                ),
                Widgets.heightSpaceH05,
                Texts.textNormal("Connect your wearable devices to enhance your health tracking",size: 14,textAlign: TextAlign.start),
                Widgets.heightSpaceH2,
                ...devices.map((device) => Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    border: Border.all(color: Colors.blue.shade100),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConstants.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(device['icon']!, height: 30.h, width: 30.w),
                          )),
                      Widgets.widthSpaceW2,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texts.textBold(
                              device['name']!,textAlign: TextAlign.start,size: 16



                            ),
                            Widgets.heightSpaceH05,
                            Texts.textNormal(
                              device['desc']!,textAlign: TextAlign.start,size: 12

                            ),
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.darkPrimaryColor,
                            borderRadius: BorderRadius.circular(8),

                          ),
                          child: Padding(
                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Image.asset(Assets.chainIcon,height: 20,width: 20,),
                      ),),
                    ],
                  ),
                )),
                Widgets.heightSpaceH1,
                Texts.textBold(
                  'Why Connect Wearable Devices?',size: 18

                ),
        Widgets.heightSpaceH05,
                Texts.textNormal("Connecting your wearable devices allows us to provide more accurate insights about how your symptoms relate to:",size: 14,textAlign: TextAlign.start),
                Widgets.heightSpaceH2,

                IconTextWidget(text: "Sleep patterns and quality"),
                Widgets.heightSpaceH05,
                IconTextWidget(text: "Activity levels and exercise"),
                Widgets.heightSpaceH05,
                IconTextWidget(text: "Heart rate variability and stress"),
                Widgets.heightSpaceH05,
                IconTextWidget(text: "Temperature fluctuations"),
                Widgets.heightSpaceH2,

              ],
            ),
          ),
        ),
      ],
    );
  }
}


