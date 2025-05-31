import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/controller/controller.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/past_entries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/symptoms.dart';



class TrackView extends StatelessWidget {
  final TrackController controller = Get.put(TrackController());

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
                ColorConstants.simpleTrackerGradient1,
                ColorConstants.simpleTrackerGradient2,
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: ColorConstants.transparentColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Texts.textBold("Symptoms Tracker", size: 20),
              ),
              Widgets.heightSpaceH1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Texts.textNormal(
                  "Your symptoms are real. Track them to take control.",
                  textAlign: TextAlign.start,
                  size: 14,
                ),
              ),
              Widgets.heightSpaceH1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  controller: controller.tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorConstants.darkPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: controller.myTabs,
                ),
              ),
              Widgets.heightSpaceH1,
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SymptomsView(),
                    PastEntries(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
