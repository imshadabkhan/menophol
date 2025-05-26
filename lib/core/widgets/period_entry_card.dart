
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/past_enteries.dart';

class PeriodEntryCard extends StatelessWidget {
  const PeriodEntryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.whiteColor,
          border: Border.all(color: ColorConstants.greyBorderColor)

      ),
      child: Padding(
        padding:EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConstants.greenColor
                  ),
                  child: Padding(padding: PaddingConstants.contentPadding,child: Texts.textNormal("Period Start",size: 14),),
                ),
                Image.asset(Assets.deleteIcon,width: 15.w,height: 15.h,),


              ],),
            Widgets.heightSpaceH2,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textMedium('Date',size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("April 7,2025",size: 14)

                  ],),
                Widgets.widthSpaceW4, Widgets.widthSpaceW4, Widgets.widthSpaceW4,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textMedium('Flow',size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Heavy",size: 14)

                  ],),

              ],),
            Widgets.heightSpaceH2,
            Texts.textMedium("Triggers",size: 14),
            Widgets.heightSpaceH1,
            ChipWidget(label: "Cramps",),


          ],),
      ),
    );
  }
}