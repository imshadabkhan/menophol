import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/symptoms_severity_row_widget.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/validate/validate_view.dart';

class RecentSymptomsWidgets extends StatelessWidget {
  const RecentSymptomsWidgets({
    super.key,
    required this.colorList,
    required this.symptomsTitleList,
  });

  final List<Color> colorList;
  final List<String> symptomsTitleList;

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
                  child: Image.asset(Assets.symptomsIcon,height: 20,width: 20,),
                ),),
              Widgets.widthSpaceW2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts.textBold("Recent Symptoms",size: 18),
                  Widgets.heightSpaceH05,
                  Texts.textNormal("Each bar represents symptom  severity", size: 12)


                ],
              ),
            ],
          ),
          Widgets.heightSpaceH2,
          Widgets.divider(),
          Widgets.heightSpaceH2,
          SymptomsSeverityRowWidget(colorList: colorList,title: symptomsTitleList[0],icon: Assets.sweatIcon,),
          SymptomsSeverityRowWidget(colorList: colorList,title: symptomsTitleList[1],icon: Assets.insomnia,),
          SymptomsSeverityRowWidget(colorList: colorList,title: symptomsTitleList[2],icon: Assets.hotFlushes,),
          SymptomsSeverityRowWidget(colorList: colorList,title: symptomsTitleList[3],icon: Assets.headaches,),
          SymptomsSeverityRowWidget(colorList: colorList,title: symptomsTitleList[4],icon: Assets.anxietyIcon,),
          SymptomsSeverityRowWidget(colorList: colorList,title: symptomsTitleList[5],icon: Assets.fatigueIcon,),




        ],),
      ),
    );
  }
}