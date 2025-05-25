import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_slider.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class TrackPeriods extends StatelessWidget {
   TrackPeriods({super.key});
List<String> symptomsList=["Cramps","Bloating","Headache",'Fatigue','Mood Swings',"Backache","Breast Tenderness"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            EntryField(
              prefixIcon: Assets.calendarIcon,
              hint: "07/04/2025",
            ),
            Texts.textMedium("Flow Intensity",),
            Widgets.heightSpaceH05,
            SeveritySlider(labels: ["Spotting","Light","Medium",'Heavy',"Very Heavy"],),
            Widgets.heightSpaceH2,
            Texts.textMedium("Symptoms"),
            Widgets.heightSpaceH05,
              Wrap(
                direction:Axis.horizontal,
                children: List.generate(symptomsList.length, (index)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:RadioBtnWithTextChip(isSelected:false,label: symptomsList[index]),
                ),),),
              Widgets.heightSpaceH05,
              Texts.textMedium("Custom Symptoms",size: 16),
              Widgets.heightSpaceH05,
              Row(children: [
                Expanded(
                    flex: 3,
                    child: EntryField(
                      hint: "Enter custom symptom",
          
                    )),
                Widgets.widthSpaceW2,
                Expanded(
                  child: CustomButton(
                    height: 40.h,
                    backgroundColor: ColorConstants.darkPrimaryColor,
                    label: "Add",
                    textColor: ColorConstants.whiteColor,
                  ),
                ),
          
              ],),
              Widgets.heightSpaceH05,
              EntryField(

                label: 'Notes',
                hint: 'Add any personal observation or additional details',
          
              ),
              Widgets.heightSpaceH2,
              CustomButton(
                backgroundColor: ColorConstants.darkPrimaryColor,
                label: "Mark period start",
                color: ColorConstants.whiteColor,
              ),
          
          
          
          
          ],),
        ),
      ),
    );
  }
}
