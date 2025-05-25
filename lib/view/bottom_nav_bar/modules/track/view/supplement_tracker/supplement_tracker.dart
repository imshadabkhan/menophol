import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

import 'package:menophol/view/bottom_nav_bar/modules/track/view/supplement_tracker/database.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/supplement_tracker/past_enteries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/supplement_tracker/supplements.dart';

class SupplementTracker extends StatefulWidget {
  const SupplementTracker({super.key});

  @override
  _SupplementTrackerState createState() => _SupplementTrackerState();
}

class _SupplementTrackerState extends State<SupplementTracker> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Supplements'),
    Tab(text: 'Past Entries'),
    Tab(text: 'Database'),

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
          backgroundColor: ColorConstants.transparentColor,
          appBar: AppBar(
            backgroundColor: ColorConstants.transparentColor,
            leading: BackButton(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textBold("Supplement Tracker",size: 20),),
              Widgets.heightSpaceH05,
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textNormal("Track your supplements and vitamins",textAlign: TextAlign.start,size: 14),
              ),
              Widgets.heightSpaceH1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  labelColor: ColorConstants.blackColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: myTabs,
                ),
              ),
              Widgets.heightSpaceH1,
              Expanded(
                child: TabBarView(

                  controller: _tabController,
                  children: [
                    Supplements(),
                   PastEnteries(),
                    Database(),

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


