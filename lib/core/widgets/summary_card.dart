
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
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorConstants.borderColor)
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
                    Texts.textBold(title, size: 18),
                    Widgets.heightSpaceH05,
                    Text(dateRange, style: TextStyle(color: Colors.grey[600], fontSize: 12))


                  ],
                ),
              ],
            ),
            Widgets.heightSpaceH2,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 7.0,
                  percent: 0.3,
                  center: Text("3",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                  progressColor: Colors.green,
                ),
                Widgets.widthSpaceW3,
                Flexible(
                  child: Column(children: [
                    SypmtomRowWidget(color: ColorConstants.grayColor,title: "Mild",),
                    Widgets.heightSpaceH2,
                    SypmtomRowWidget(color:ColorConstants.darkPeachColor ,title: "Severe",),
                  ],),
                ),

                Flexible(
                  child: Column(children: [
                    SypmtomRowWidget(color: ColorConstants.peachColor,title: "Moderate",),
                    Widgets.heightSpaceH2,
                    SypmtomRowWidget(color:ColorConstants.redColor,title: "Extreme",),


                  ],),
                ),


              ],
            ),
            Widgets.heightSpaceH1,
            Widgets.customDivider(),
            Widgets.heightSpaceH1,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SypmtomRowWidget(height:10,width:10,color: Colors.grey,title: "Mood Swings",)),
                Expanded(child: SypmtomRowWidget(height:10,width:10,color: Colors.grey,title: "Anxiety",)),
                Expanded(child: SypmtomRowWidget(height:10,width:10,color: Colors.grey,title: "Night Sweats",)),
              ],
            ),




          ],
        ),
      ),
    );
  }
}

