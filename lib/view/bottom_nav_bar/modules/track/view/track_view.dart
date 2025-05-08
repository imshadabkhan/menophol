import 'package:flutter/material.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/past_entries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms.dart';

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
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}



// SafeArea(
// child: Padding(
// padding: const EdgeInsets.all(16),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Texts.textBold("Track",size: 22),
// Widgets.heightSpaceH05,
// Texts.textNormal(
// 'Track your symptoms, sleep, mood, and more to uncover patterns, gain insights, and take back control of your health.'
// , size: 16,textAlign: TextAlign.start
// ),
// Widgets.heightSpaceH2,
// Texts.textBold(
// 'What would you like to track today?',
// size: 24
// ),
// Widgets.heightSpaceH1,
// Expanded(
// child: ListView.separated(
// itemCount: trackItems.length,
// separatorBuilder: (_, __) => const SizedBox(height: 12),
// itemBuilder: (context, index) {
// final item = trackItems[index];
// return Container(
// padding: const EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(12),
// border: Border.all(
// color:
// ColorConstants.primaryColor.withAlpha((0.3*255).toInt()),
//
// ),
// ),
// child: Row(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.pink.shade50,
// borderRadius: BorderRadius.circular(10.r),
//
// ),
// alignment: Alignment.center,
//
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 12),
// child: Image.asset(item.icon,height: 32.h,width: 32.w,),
// ),
// ),
// Widgets.widthSpaceW2,
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Texts.textBold(item.title,size: 22
// ),
// Widgets.heightSpaceH05,
// Texts.textNormal(item.subtitle,size: 16,textAlign: TextAlign.start
// ),
// ],
// ),
// ),
//
// ],
// ),
// );
// },
// ),
// ),
// ],
// ),
// ),
// )


//
// final List<TrackItem> trackItems = [
//   TrackItem(icon:Assets.symptomsIcon, title: 'Symptoms', subtitle: 'Track your hormonal health symptoms'),
//   TrackItem(icon: Assets.unfilledHeart, title: 'Mood', subtitle: 'Monitor your emotional wellbeing'),
//   TrackItem(icon: Assets.sleepIcon, title: 'Sleep', subtitle: 'Track your sleep patterns'),
//   TrackItem(icon: Assets.foodDrinkIcon, title: 'Food & Drink', subtitle: 'Track your diet and liquid intake'),
//   TrackItem(icon: Assets.dumbellIcon, title: 'Exercise', subtitle: 'Log your physical activity'),
//   TrackItem(icon: Assets.hrtIcon, title: 'HRT', subtitle: 'Track your hormone therapy'),
//   TrackItem(icon: Assets.supplimentsIcon, title: 'Supplements', subtitle: 'Track your supplements and vitamins'),
//   TrackItem(icon: Assets.periodsIcon, title: 'Periods', subtitle: 'Track your menstrual cycle'),
// ];