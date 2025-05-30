import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';



import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/glp_medication/view/glp1_medication/controller.dart';
import 'package:menophol/view/glp_medication/view/manage_medications.dart';
import 'package:menophol/view/glp_medication/view/medication_database/medications_database.dart';


import 'package:get/get.dart';






class GlpMedications extends StatelessWidget {
  GlpMedications({super.key});

  final GlpMedicationsController controller =
  Get.put(GlpMedicationsController());

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
                ColorConstants.whiteColor,
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textBold("GLP-1 Medications", size: 20),
                    Widgets.heightSpaceH05,
                    Texts.textNormal(
                      "Explore GLP-1 medications designed to support weight management and metabolic health.",
                      textAlign: TextAlign.start,
                      size: 14,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
              Widgets.heightSpaceH2,
              Widgets.heightSpaceH1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  controller: controller.tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorConstants.darkPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: controller.myTabs,
                ),
              ),
              Widgets.heightSpaceH1,
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    ManageMedications(),
                    GlpMedicationDatabase(),
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






