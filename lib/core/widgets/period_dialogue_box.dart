
import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_slider.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class PreviousPeriodDialogBox extends StatelessWidget {
  PreviousPeriodDialogBox({super.key});

  final List<String> commonSymptoms = [
    "Cramps", "Bloating", "Headache", "Fatigue",
    "Mood Swings", "Backache", "Breast Tenderness"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: PaddingConstants.screenPaddingHalf.copyWith(top: 30, bottom: 30),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          child: SingleChildScrollView(
            child: Padding(
              padding: PaddingConstants.screenPaddingHalf.copyWith(top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Shrink-wrap the height
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texts.textBold('Add Previous Period',size: 20),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Widgets.heightSpaceH05,
                  Texts.textNormal(
                      "Record a past menstrual cycle by adding start and end dates",
                      textAlign: TextAlign.start,size: 14
                  ),
                  Widgets.heightSpaceH1,
                  EntryField(label: "Start Date", prefixIcon: Assets.calendarIcon,hint: '7/4/2025',),
                  EntryField(label: "End Date", prefixIcon: Assets.calendarIcon,hint: "7/4/2025",),
                  Widgets.heightSpaceH05,
                  Texts.textMedium('Flow Intensity',size: 14),
                  SeveritySlider(),
                  Widgets.heightSpaceH2,
                  Texts.textMedium('Common Symptoms',size: 14),
                  Widgets.heightSpaceH1,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      commonSymptoms.length,
                          (index) => RadioBtnWithTextChip(label: commonSymptoms[index]),
                    ),
                  ),
                  Widgets.heightSpaceH2,
                  EntryField(label: "Additional Notes"),
                  Widgets.heightSpaceH1,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderColor: ColorConstants.greyBorderColor,
                          label: "Cancel",
                          textColor: ColorConstants.grayColor,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      Widgets.widthSpaceW4,
                      Expanded(
                        child: CustomButton(
                          label: 'Add',
                          backgroundColor: ColorConstants.darkPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}