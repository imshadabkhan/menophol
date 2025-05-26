import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/past_enteries.dart';

class DoctorCard extends StatelessWidget {
  final Map doc;
  final String icon;

  DoctorCard({super.key, required this.doc, required this.icon});

  List<String> symptomsList = [
    "Hot Flushes",
    "Harmone Therapy",
    "Sleep Issues",
    "Mood Changes"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyBgColor),
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Texts.textBold(doc["name"], size: 20, maxlines: 2),
                Widgets.widthSpaceW3,
                Icon(Icons.star, color: Colors.orange, size: 18),
                Widgets.widthSpaceW05,
                Texts.textNormal(doc["rating"], size: 15),
              ],
            ),
            Widgets.heightSpaceH05,
            Texts.textNormal(doc["specialty"],
                size: 14, textAlign: TextAlign.start),
            const SizedBox(height: 6),
            Widgets.divider(),
            Widgets.heightSpaceH2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Assets.doctorLocationIcon,
                        height: 20, width: 20),
                    Widgets.widthSpaceW1,
                    Texts.textNormal(doc["location"], size: 14),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 20,
                  width: 1,
                  color: ColorConstants.grayColor,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(Assets.calendarIcon, height: 20, width: 20),
                      Widgets.widthSpaceW05,
                      Expanded(
                        child: Texts.textNormal(
                          doc["experience"],
                          size: 14,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Widgets.heightSpaceH2,
            Widgets.divider(),
            Widgets.heightSpaceH1,
            Wrap(
              spacing: 8,
              children: (doc["available"] as List<String>).map((option) {
                String iconPath;

                if (option.toLowerCase() == "corporate") {
                  iconPath = Assets.corporateIcon;
                } else if (option.toLowerCase() == "in person") {
                  iconPath = Assets.inpersonIcon;
                } else if (option.toLowerCase() == "online") {
                  iconPath = Assets.onlineIcon;
                } else {
                  iconPath = Assets.onlineIcon; // fallback if needed
                }

                return Chip(

                  side: BorderSide.none,
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(iconPath, height: 15, width: 15),
                      Widgets.widthSpaceW1,
                      Text(option),
                    ],
                  ),
                  backgroundColor: ColorConstants.primaryColor
                      .withAlpha((0.2 * 255).toInt()),
                  labelStyle: TextStyle(color: ColorConstants.redTextColor),
                );
              }).toList(),
            ),
            Widgets.heightSpaceH2,
            CustomButton(
              backgroundColor: ColorConstants.darkPrimaryColor,
              label: "Book consultation",
              onTap: () {
                // Handle tap
              },
            ),
            Widgets.heightSpaceH1,
            CustomButton(
              borderColor: ColorConstants.blackColor,
              label: "View details",
              textColor: ColorConstants.blackColor,
              onTap: () {
                Get.dialog(
                  DoctorDialogBox(symptomsList: symptomsList,name: doc["name"],speaciality:doc["specialty"],),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
