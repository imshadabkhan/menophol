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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Texts.textBold(name,
                      size: 16, maxlines: 1, textAlign: TextAlign.start),
                  Widgets.widthSpaceW1,
                  Icon(
                    Icons.star,
                    color: ColorConstants.goldenColor,
                    size: 16,
                  ),
                  Widgets.widthSpaceW05,
                  Texts.textNormal('4.9', size: 12),
                  Expanded(child: Widgets.widthSpaceW1),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      size: 18,
                      Icons.close,
                    ),
                  ),
                ],
              ),
              Texts.textNormal(speaciality,
                  size: 12, textAlign: TextAlign.start),
            ],
          ),
          Widgets.heightSpaceH1,
          Widgets.divider(),
          Widgets.heightSpaceH1,
          Texts.textNormal(
              "Specializing in personalized menopause care with focus on hormone optimization and lifestyle medicine.",
              textAlign: TextAlign.start,
              size: 12,
              overflow: TextOverflow.ellipsis,
              maxLines: 5),
          Widgets.heightSpaceH1,
          Wrap(
            children: List.generate(
                symptomsList.length,
                (int index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ChipWidget(
                        label: symptomsList[index],
                        bgColor: ColorConstants.primaryColor
                            .withAlpha((0.3 * 255).toInt()),
                        textColor: ColorConstants.darkPrimaryColor,
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
                width: 15,
                height: 15,
              ),
              Widgets.widthSpaceW1,
              Texts.textNormal("+44 20 24253456", size: 12),
            ],
          ),
          Widgets.heightSpaceH1,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.emailIcon,
                width: 15,
                height: 15,
              ),
              Widgets.widthSpaceW1,
              Expanded(
                child: Texts.textNormal("dr.thompson@menopal.com",
                    size: 12, textAlign: TextAlign.start),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
