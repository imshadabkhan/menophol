import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/symptom_chart.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SymptomsTrendWidget extends StatelessWidget {
  const SymptomsTrendWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorConstants.greyBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.primaryColor
                          .withAlpha((0.5 * 255).toInt()),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Assets.sleepingIcon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                Widgets.widthSpaceW2,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texts.textBold("Symptom Trends", size: 16),
                      Widgets.heightSpaceH05,
                      Texts.textNormal(
                          "Monitor your sleep quality and duration and patterns",
                          textAlign: TextAlign.start,
                          size: 8),
                    ],
                  ),
                ),
              ],
            ),
            Widgets.heightSpaceH1,
            Widgets.divider(),
            Widgets.heightSpaceH1,
            SymptomSeverityChart(),
          ],
        ),
      ),
    );
  }
}
