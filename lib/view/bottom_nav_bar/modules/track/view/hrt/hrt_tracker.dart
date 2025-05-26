import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';

import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/medication_card.dart';

import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

import 'medication_tracker/add_medication.dart';

class HrtTracker extends StatelessWidget {
  const HrtTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.whiteColor,
          ),
        ),
        Container(
          height: 600.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                stops: [
                  0.0,
                  0.7,
                  0.8,
                  1.0
                ],
                colors: [
                  ColorConstants.exerciseTrackerGradient1,
                  ColorConstants.exerciseTrackerGradient2,

                  ColorConstants.exerciseTrackerGradient2.withAlpha(
                      (0.4 * 255).toInt()), // Smoothly fade to white background
                  Colors.white,
                ]),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Texts.textNormal("Add Medication", size: 14),
               Widgets.widthSpaceW2,
                FloatingActionButton(

                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: ColorConstants.darkPrimaryColor,
                  onPressed: () {
                    Get.to(() => AddMedicationMedication());
                  },
                  child: Icon(
                    Icons.add,
                    color: ColorConstants.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            leading: BackButton(),
          ),
          body: Padding(
            padding: PaddingConstants.screenPaddingHalf,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts.textBold("HRT Tracker", size: 20),
                  Widgets.heightSpaceH05,
                  Texts.textNormal(
                      "Track your HRT to spot patterns and support better health decisions",
                      textAlign: TextAlign.start,
                      size: 14,
                      maxLines: 5),
                  Widgets.heightSpaceH3,
                  EntryField(
                    prefixIcon: Assets.calendarIcon,
                    hint: "07/04/2025",
                  ),
                  Widgets.heightSpaceH1,
                  Texts.textBold("Current Medications(1)", size: 18),
                  Widgets.heightSpaceH1,
                  MedicationCard(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
