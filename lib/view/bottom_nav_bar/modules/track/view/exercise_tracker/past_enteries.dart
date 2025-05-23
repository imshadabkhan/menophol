import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ExercisePastEnteries extends StatelessWidget {
  const ExercisePastEnteries({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Padding(
      padding: PaddingConstants.screenPaddingHalf,
      child: Column(children: [
        EntryField(
          prefixIcon: Assets.calendarIcon,
          hint: "07/04/2025",
        ),
Widgets.heightSpaceH1,
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.whiteColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ColorConstants.grayColor),

          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                Texts.textBold("Walking",size: 20),
                  Image.asset(Assets.deleteIcon,height: 15.h,width: 15.w,),

              ],),
              Widgets.heightSpaceH2,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Texts.textMedium('Time',size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal('1 hour 10 mins',size: 14),

                  ],),
                ),
                Widgets.widthSpaceW1,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Texts.textMedium('Intensity',size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal('7/10',size: 14),

                  ],),
                )
              ],)



            ],),
          ),
        )

      ],),
    ),);
  }
}
