import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/exercise.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/past_enteries.dart';




class ExerciseTrackerView extends StatefulWidget {
  const ExerciseTrackerView({super.key});

  @override
  _ExerciseTrackerViewState createState() => _ExerciseTrackerViewState();
}

class _ExerciseTrackerViewState extends State<ExerciseTrackerView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Exercise'),
    Tab(text: 'Past Enteries'),
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
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textBold("Exercise Tracker",size: 18),),
              Widgets.heightSpaceH05,
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textNormal("Track your exercise to see what’s energizing or exhausting you.",textAlign: TextAlign.start,size: 12),
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
                    Exercise(),
                    ExercisePastEnteries(),

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


