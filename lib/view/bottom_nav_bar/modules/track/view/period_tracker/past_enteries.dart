import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/period_entry_card.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class PeriodsPastEnteries extends StatelessWidget {
  const PeriodsPastEnteries({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

        ],),
      ),
    );
  }
}


class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyBorderColor),
        color:ColorConstants.chipBGColor,


        borderRadius: BorderRadius.circular(8),


      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),child:  Texts.textNormal(label,size: 14),


      ),
    );
  }
}
