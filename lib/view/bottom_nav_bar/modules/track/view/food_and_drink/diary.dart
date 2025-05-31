import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class Diary extends StatelessWidget {
  const Diary({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          EntryField(
            prefixIcon: Assets.calendarIcon,
            hint: "07/04/2025",
          ),
          Widgets.heightSpaceH05,
          Column(
            children: [
              DairyWidget(),
            ],
          )


        ],),
      ),
    );
  }
}
class DairyWidget extends StatelessWidget {
  const DairyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(

        width: double.infinity,
        decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        border: Border.all(color: ColorConstants.greyBorderColor,
    ),
    borderRadius: BorderRadius.circular(20),
    ),
    child:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texts.textBold("Monday",size: 18,color: ColorConstants.primaryColor),
          Widgets.heightSpaceH05,
          Texts.textNormal("April 7, 2025",size: 14),
          Widgets.heightSpaceH1,
          Widgets.divider(),
          Widgets.heightSpaceH1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
            width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorConstants.primaryColor.withAlpha((0.8*255).toInt()),
                      ColorConstants.primaryColor.withAlpha((0.5*255).toInt()),
                  ColorConstants.whiteColor

                ]),
                border: Border.all(color: ColorConstants.darkPrimaryColor,



                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Texts.textBold("Breakfast",size: 18,color: ColorConstants.darkPrimaryColor),
                    Widgets.heightSpaceH1,
                    Texts.textNormal("Food",size: 14),
                    Widgets.heightSpaceH1,
                    Row(
                      children: [
                        TimeChipWidget(time: "6:45",),
                        Widgets.widthSpaceW2,
                        Texts.textNormal("Eggs",size: 14),
                      ],
                    ),
                            Widgets.heightSpaceH1,
                    Row(
                      children: [
                        TimeChipWidget(time: "6:45",),
                        Widgets.widthSpaceW2,
                        Texts.textNormal("Fruit",size: 14),
                      ],
                    ),
                    Widgets.heightSpaceH1,
                    Widgets.divider(),
                    Widgets.heightSpaceH1,
                    Texts.textNormal("Drinks",size: 14),
                    Widgets.heightSpaceH1,
                    Row(
                      children: [
                        TimeChipWidget(time: "6:45",),
                        Widgets.widthSpaceW2,
                        Texts.textNormal("Tea",size: 14),
                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}


class TimeChipWidget extends StatelessWidget {
  const TimeChipWidget({
    super.key,
    required this.time

  });
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha((0.5*255).toInt()),
        border: Border.all(color: ColorConstants.greyBorderColor,width: 2),
        borderRadius: BorderRadius.circular(4),

      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),child: Texts.textNormal(time,size: 12),),
    );
  }
}