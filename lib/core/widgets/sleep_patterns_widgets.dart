import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/sleep_chart.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SleepPatternWidgets extends StatelessWidget {
  const SleepPatternWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorConstants.greyBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: ColorConstants.primaryColor.withAlpha((0.5*255).toInt()),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Assets.sleepingIcon,height: 20,width: 20,),
                ),),
              Widgets.widthSpaceW2,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textBold("Sleep Patterns",size: 16),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Monitor your sleep quality and duration and patterns",textAlign: TextAlign.start,size: 12),




                  ],
                ),
              ),
            ],
          ),
          Widgets.heightSpaceH1,
          Widgets.divider(),
          Widgets.heightSpaceH1,
          SleepPatternChart(),




        ],),
      ),
    );
  }
}