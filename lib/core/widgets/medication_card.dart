import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/dynamic_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textBold("Sandrena Gel", size: 20),
                    Widgets.heightSpaceH1,
                    Texts.textNormal('1mg(1 sachet)daily', size: 14),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DynamicButton(title: "Add Reminder",icon: Assets.reminder,borderColor: ColorConstants.blackColor,),
                      Widgets.heightSpaceH1,
                      DynamicButton(title: "Remove",icon: Assets.deleteIcon,borderColor: ColorConstants.redTextColor,textColor: ColorConstants.redTextColor,),

                    ],
                  ),
                ),
              ],
            ),
            Widgets.heightSpaceH1,
            Widgets.divider(),
            Widgets.heightSpaceH1,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textMedium("Method", size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Gel", size: 14),
                  ],
                ),
                Widgets.widthSpaceW4,
                Widgets.widthSpaceW4,
                Widgets.widthSpaceW4,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textMedium("Frequency", size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("Daily", size: 14),
                  ],
                ),
              ],
            ),
            Widgets.heightSpaceH2,
            Container(
              decoration: BoxDecoration(
                border:
                Border.all(color: ColorConstants.darkPrimaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          Assets.infoIcon,
                          height: 20,
                          width: 20,
                        ),
                        Widgets.widthSpaceW1,
                        Texts.textBold("Dosage Information",
                            color: ColorConstants.primaryColor,
                            size: 18),
                      ],
                    ),
                    Widgets.heightSpaceH05,
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: ColorConstants.blackColor,
                                fontWeight: FontWeight.bold),
                            text: 'Initial dosage: ',
                            children: [
                              TextSpan(
                                text:
                                'Apply 1 applicatorful (0.5 mg estriol) daily for the first 2 to 3 weeks. Maintenance dose: After initial treatment, reduce to 1 applicatorful twice a week.',
                                style: TextStyle(
                                    color: ColorConstants.blackColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ])),
                  ],
                ),
              ),
            ),
            Widgets.heightSpaceH2,
            Row(
              children: [
                Image.asset(
                  Assets.linkImage,
                  width: 15,
                  height: 15,
                ),
                Widgets.widthSpaceW1,
                Texts.textNormal("Patient Information Leaflet",
                    color: ColorConstants.primaryColor, size: 14),
              ],
            )
          ],
        ),
      ),
    );
  }
}