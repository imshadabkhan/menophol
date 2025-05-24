import 'package:flutter/material.dart';

import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/period_entry_card.dart';

import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class PeriodsPastEnteries extends StatelessWidget {
  const PeriodsPastEnteries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          children: [
            EntryField(
              prefixIcon: Assets.calendarIcon,
              hint: "07/04/2025",
            ),
            Widgets.heightSpaceH1,
            PeriodEntryCard()
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.label,
    this.bgColor,
    this.textColor,
  });
  final String label;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyBorderColor),
        color: bgColor ?? ColorConstants.chipBGColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Texts.textNormal(label,
            size: 14, color: textColor ?? ColorConstants.blackColor),
      ),
    );
  }
}
