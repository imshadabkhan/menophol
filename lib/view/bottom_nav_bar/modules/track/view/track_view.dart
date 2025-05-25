import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/past_entries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/symptoms.dart';

class TrackView extends StatefulWidget {
  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Symptoms'),
    Tab(text: 'Past Entries'),

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
          height: 200.h,
          decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [

                  ColorConstants.simpleTrackerGradient1,
                  ColorConstants.simpleTrackerGradient2,

                ]),
          ),
        ),


        Scaffold(
          backgroundColor: ColorConstants.transparentColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
         leading: BackButton(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textBold("Symptoms Tracker",size: 24),),
        Widgets.heightSpaceH1,
               Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textNormal("Your symptoms are real. Track them to take control.",textAlign: TextAlign.start,size: 16),
               ),
               Widgets.heightSpaceH1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  labelColor: Colors.black,
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


