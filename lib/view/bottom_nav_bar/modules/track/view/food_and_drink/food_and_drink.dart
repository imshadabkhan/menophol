import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/food_and_drink/diary.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/food_and_drink/track.dart';



class FoodAndDrinkOrder extends StatefulWidget {
  const FoodAndDrinkOrder({super.key});

  @override
  _FoodAndDrinkOrderState createState() => _FoodAndDrinkOrderState();
}

class _FoodAndDrinkOrderState extends State<FoodAndDrinkOrder> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Track'),

    Tab(text: 'Diary'),

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

                  Colors.pinkAccent,
                  ColorConstants.whiteColor,

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
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textBold("Food & Drink Tracker",size: 20),),
              Widgets.heightSpaceH1,
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textNormal("Track your drinks to stay hydrated and understand your intake patterns.",textAlign: TextAlign.start,size: 14),
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
                    Track(),
                    Diary(),

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


