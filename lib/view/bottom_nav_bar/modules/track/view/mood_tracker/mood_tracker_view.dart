import 'package:flutter/material.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/mood_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/past_entries.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/past_entries.dart';


class MoodTrackerView extends StatefulWidget {
  const MoodTrackerView({super.key});

  @override
  _MoodTrackerViewState createState() => _MoodTrackerViewState();
}

class _MoodTrackerViewState extends State<MoodTrackerView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Mood'),
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
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textBold("Mood Tracker",size: 24),),
          Widgets.heightSpaceH1,
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Texts.textNormal("Track your mood to spot patterns in yur health and emotional wellbeing",textAlign: TextAlign.start,size: 16),
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
                MoodView(),
                MoodPastEntries(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


