import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ManageMedications extends StatelessWidget {
  const ManageMedications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            children: [
        
              CustomDropdown(
                  color: ColorConstants.transparentColor,
                  iconColor: ColorConstants.blackColor,
                  onTap: () {},
                  value: "",
                  hint: "Ovestin Cream",
                  label: 'Medication'),
              Widgets.heightSpaceH05,
              CustomDropdown(
                  color: ColorConstants.transparentColor,
                  iconColor: ColorConstants.blackColor,
                  onTap: () {},
                  value: "",
                  hint: "select dosage",
                  label: 'Dosage'),
              Widgets.heightSpaceH05,
              EntryField(
                fillColor: ColorConstants.transparentColor,
                label: "Start Date",
                prefixIcon: Assets.calendarIcon,
                hint: "07/04/2025",
              ),
              Widgets.heightSpaceH05,
              CustomDropdown(
                  color: ColorConstants.transparentColor,
                  iconColor: ColorConstants.blackColor,
                  onTap: () {},
                  value: '',
                  hint: 'weekly',
                  label: 'Frequency'),
              Widgets.heightSpaceH05,
              CustomDropdown(
                  color: ColorConstants.transparentColor,
                  iconColor: ColorConstants.blackColor,
                  onTap: () {},
                  value: '',
                  hint: '------',
                  label: 'Reminder Time(optional)'),
              Widgets.heightSpaceH05,
              EntryBigField(
                fillColor: ColorConstants.transparentColor,
                label: "Additional Notes",
                hint: "Additional notes here..",
              ),
              Widgets.heightSpaceH1,
              CustomButton(
                label: "Add medication",
                backgroundColor: ColorConstants.darkPrimaryColor,
                textColor: ColorConstants.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
