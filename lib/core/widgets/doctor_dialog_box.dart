import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/past_enteries.dart';

class DoctorDialogBox extends StatelessWidget {
  const DoctorDialogBox({
    super.key,
    required this.symptomsList,
    required this.name,
    required this.speaciality,
  });

  final List<String> symptomsList;
  final String name;
  final String speaciality;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize
            .min, // <- This makes the height depend on content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Texts.textBold(name, size: 18,overFlow: TextOverflow.ellipsis),
                  Widgets.widthSpaceW1,
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorConstants.goldenColor,
                        size: 18,
                      ),
                      Widgets.widthSpaceW05,
                      Texts.textNormal('4.9', size: 14),
                    ],
                  ),
                  Expanded(
                    child: Widgets.widthSpaceW05,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),

              Texts.textNormal(
                  speaciality,
                  size: 14,
                  textAlign: TextAlign.start),
            ],
          ),
          Widgets.heightSpaceH1,
          Widgets.divider(),
          Widgets.heightSpaceH1,
          Texts.textNormal(
              "Specializing in personalized menopause care with focus on hormone optimization and lifestyle medicine.",
              textAlign: TextAlign.start,size: 14,overflow: TextOverflow.ellipsis,maxLines: 5),
          Widgets.heightSpaceH1,
          Wrap(
            children: List.generate(
                symptomsList.length,
                    (int index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ChipWidget(
                    label: symptomsList[index],
                    bgColor: ColorConstants.primaryColor.withAlpha((0.3*255).toInt()),
                    textColor:
                    ColorConstants.darkPrimaryColor,
                  ),
                )),
          ),
          Widgets.heightSpaceH1,
          Widgets.divider(),
          Widgets.heightSpaceH2,
          Row(
            children: [
              Image.asset(
                Assets.phoneIcon,
                width: 20,
                height: 20,
              ),
              Widgets.widthSpaceW1,
              Texts.textNormal("+44 20 24253456", size: 14),
            ],
          ),
          Widgets.heightSpaceH1,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.emailIcon,
                width: 20,
                height: 20,
              ),
              Widgets.widthSpaceW1,
              Expanded(
                child: Texts.textNormal("dr.thompson@menopal.com",
                    size: 14, textAlign: TextAlign.start),
              ),
            ],
          ),
        ],
      ),
    );
  }
}