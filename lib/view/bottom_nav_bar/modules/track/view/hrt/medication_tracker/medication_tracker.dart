import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/dynamic_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/medication_card.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_tracker/add_medication.dart';

class MedicationTracker extends StatelessWidget {
  const MedicationTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Texts.textNormal("Add Medication", size: 16),
            const SizedBox(width: 8),
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
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EntryField(
                prefixIcon: Assets.calendarIcon,
                hint: "07/04/2025",
              ),
              Widgets.heightSpaceH1,
              Texts.textBold("Current Medications(1)", size: 20),
              Widgets.heightSpaceH1,
              MedicationCard(),
            ],
          ),
        ),
      ),
    );
  }
}




