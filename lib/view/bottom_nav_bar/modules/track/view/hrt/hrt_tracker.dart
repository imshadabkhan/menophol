import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';

import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/dynamic_button.dart';

import 'package:menophol/core/widgets/period_dialogue_box.dart';

import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_database.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_tracker/medication_tracker.dart';


class HrtTracker extends StatefulWidget {
  const HrtTracker({super.key});

  @override
  _HrtTrackerState createState() => _HrtTrackerState();
}

class _HrtTrackerState extends State<HrtTracker> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Medication Tracker'),
    Tab(text: 'Medication Database'),

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(

                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [

                  ColorConstants.exerciseTrackerGradient1,
                  ColorConstants.exerciseTrackerGradient2

                ]),
          ),

        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            leading: BackButton(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:3,
                      child: Column

                        (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Texts.textBold("HRT Tracker",size: 20),
                        Widgets.heightSpaceH05,
                        Texts.textNormal("Track your HRT to spot patterns and support better health decisions",textAlign: TextAlign.start,size: 14,maxLines: 5),


                      ],),
                    ),
                   Expanded(child:  Widgets.widthSpaceW4,),

                    DynamicButton(title: "Reset & Refresh Data",),
                  ],),
              ),
              Widgets.heightSpaceH2,



              Widgets.heightSpaceH1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorConstants.darkPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: myTabs,
                ),
              ),
              Widgets.heightSpaceH1,
              Expanded(
                child: TabBarView(

                  controller: _tabController,
                  children: [
                    MedicationTracker(),

                    MedicationDatabase(),

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




