import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';

import 'package:menophol/core/constants/color_constants.dart';

import 'package:menophol/core/widgets/custom_button.dart';

import 'package:menophol/core/widgets/period_dialogue_box.dart';

import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/past_enteries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/track_periods.dart';


class PeriodTrackerView extends StatefulWidget {
  const PeriodTrackerView({super.key});

  @override
  _PeriodTrackerViewState createState() => _PeriodTrackerViewState();
}

class _PeriodTrackerViewState extends State<PeriodTrackerView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Track Period'),
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
          decoration: BoxDecoration(
            gradient: LinearGradient(

                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [

                  ColorConstants.primaryColor,
                  ColorConstants.whiteColor

                ]),
          ),

        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
                  children: [
                  Column(children: [
                    Texts.textBold("Period Tracker",size: 18),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Track your periods",textAlign: TextAlign.start,size: 12),


                  ],),
                    Widgets.widthSpaceW4,
                  Widgets.widthSpaceW4,
                    Widgets.widthSpaceW4,
                  Expanded(
                    child: CustomButton(
                      onTap: (){

                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return PreviousPeriodDialogBox();
                          },
                        );

                      },
                 iconGap: 0,
                      borderColor: ColorConstants.blackColor,
                      icon: Icon(Icons.add,color: Colors.black,),
                      label: "Add previous period",


                    textColor: ColorConstants.blackColor,
                      fontSize: 10,
                    ),
                  ),
                ],),
              ),
              Widgets.heightSpaceH2,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border:Border.all(color: ColorConstants.darkPrimaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Texts.textBold('Period Cycle Day 1',size: 18,color: ColorConstants.darkPrimaryColor),
                          Widgets.heightSpaceH05,
                          Texts.textNormal('Started on Apr 7',size: 12),
                        ],
                      ),
Widgets.widthSpaceW4,Widgets.widthSpaceW4,Widgets.widthSpaceW2,
                      Flexible(

                        child: CustomButton(
                          radius: 10.0,
                          iconGap: 4,

                          backgroundColor: ColorConstants.darkPrimaryColor,
                          icon: Image.asset(
                            Assets.calendarIcon,
                            color: ColorConstants.whiteColor,
                            height: 16,width: 16,
                          ),
                          label: "Mark end",
                          fontSize: 10,
                        ),
                      ),


                    ],),
                  ),
                ),
              ),
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
                    TrackPeriods(),
                    PeriodsPastEnteries(),

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




