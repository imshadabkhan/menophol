import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/validate/validate_view.dart';

import 'symptoms_severity_row_widget.dart';

class RecentMoodWidget extends StatelessWidget {
  const RecentMoodWidget({
    super.key,
    required this.colorList,
    required this.moodTitleList,
  });

  final List<Color> colorList;
  final List<String> moodTitleList;

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
                  child: Image.asset(Assets.recentMood,height: 20,width: 20,),
                ),),
              Widgets.widthSpaceW1,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Texts.textBold("Recent Moods",size: 16),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Each bar represents mood intensity",textAlign: TextAlign.start,size: 12),
                
                
                  ],
                ),
              ),
            ],
          ),
          Widgets.heightSpaceH2,
          Widgets.divider(),
          Widgets.heightSpaceH2,
          SymptomsSeverityRowWidget(colorList: colorList,title: moodTitleList[0],icon: Assets.happy),
          SymptomsSeverityRowWidget(colorList: colorList,title: moodTitleList[1],icon: Assets.insomnia,),
          SymptomsSeverityRowWidget(colorList: colorList,title: moodTitleList[2],icon: Assets.tiredIcon,),
          SymptomsSeverityRowWidget(colorList: colorList,title: moodTitleList[3],icon: Assets.irritable),
          SymptomsSeverityRowWidget(colorList: colorList,title: moodTitleList[4],icon: Assets.contentIcon,),




        ],),
      ),
    );
  }
}