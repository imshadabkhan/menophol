
import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/symtopms_row_widgets.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import 'widgets.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final int score;
  final String level;
  final String? icon;
  final List<String> tags;
  final Color color;

  const SummaryCard({super.key, required this.title, required this.dateRange, required this.score, required this.level, required this.tags, required this.color,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorConstants.greyBorderColor)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: ColorConstants.primaryColor.withAlpha((0.5*255).toInt()),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(icon!,height: 20,width: 20,),
                  ),),
                Widgets.widthSpaceW2,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textBold(title, size: 16),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Mar 17, 2025 - Mar 24, 2025",  size: 12)


                  ],
                ),
              ],
            ),
            Widgets.heightSpaceH2,
            Widgets.divider(),
            Widgets.heightSpaceH2,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 7.0,
                  percent: 0.3,
                 backgroundColor: ColorConstants.lightGray,
                  center: Texts.textBold("3",size: 18),
                  progressColor: ColorConstants.darkGray,
                ),
                Widgets.widthSpaceW3,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SypmtomRowWidget(color: ColorConstants.grayColor,title:tags[0],baseline: 15,),
                          Widgets.heightSpaceH2,
                          SypmtomRowWidget(color:ColorConstants.darkPeachColor ,title: tags[1],baseline: 15,),
                        ],),
                    ),
                    Widgets.widthSpaceW3,
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SypmtomRowWidget(color: ColorConstants.peachColor,title: tags[2],baseline: 15,),
                          Widgets.heightSpaceH2,
                          SypmtomRowWidget(color:ColorConstants.redColor,title: tags[3],baseline: 15,),
                        ],),
                    ),
                  ],),
                ),



              ],
            ),
            Widgets.heightSpaceH2,
            Widgets.customDivider(),
            Widgets.heightSpaceH2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SypmtomRowWidget(height:10,width:10,color: Colors.grey,title: "Mood Swings",)),
                Expanded(child: SypmtomRowWidget(height:10,width:10,color: ColorConstants.peachColor,title: "Anxiety",)),
                Expanded(child: SypmtomRowWidget(height:10,width:10,color: Colors.grey,title: "Night Sweats",)),
              ],
            ),




          ],
        ),
      ),
    );
  }
}

