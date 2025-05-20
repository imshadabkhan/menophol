import 'package:flutter/material.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/mood_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/past_entries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/sleep_tracker/sleep_past_enteries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/sleep_tracker/sleep_tracker.dart';

class SleepView extends StatefulWidget {
  const SleepView({super.key});

  @override
  _SleepViewState createState() => _SleepViewState();
}

class _SleepViewState extends State<SleepView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Sleep'),
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
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textBold("Sleep Tracker",size: 24),),
          Widgets.heightSpaceH1,
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textNormal("Track your sleep to spot what's helping or disrupting your rest.",textAlign: TextAlign.start,size: 16),
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
                SleepTracker(),
                SleepPastEnteries(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


