import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';

import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/dynamic_button.dart';

import 'package:menophol/core/widgets/period_dialogue_box.dart';

import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_database.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_tracker/medication_tracker.dart';
import 'package:menophol/view/glp_medication/view/manage_medications.dart';
import 'package:menophol/view/glp_medication/view/medications_dataabase.dart';


class GlpMedications extends StatefulWidget {
  const GlpMedications({super.key});

  @override
  _GlpMedicationsState createState() => _GlpMedicationsState();
}

class _GlpMedicationsState extends State<GlpMedications> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Manage Medications'),
    Tab(text: 'Medications Database'),

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
                child: Column

                  (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textBold("GLP-1 Medications",size: 20),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Explore GLP-1 medications designed to support weight management and metabolic health.",textAlign: TextAlign.start,size: 14,maxLines: 4),


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
                     ManageMedications(),
                    GlpMedicationDatabase()


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





