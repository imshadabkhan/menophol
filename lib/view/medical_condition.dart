import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/meal_box_widget.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class MedicalConditionView extends StatelessWidget {
   MedicalConditionView({super.key});
  final List<String> conditonList=[
    "Thyroid Disorder","Hypertension",'Osteoporosis',"Anxiety","Hypertension","Migraine","Asthama"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texts.textBold('Medical Procedures', size: 20),
              Widgets.heightSpaceH05,
              Texts.textNormal(
                  'Review and update your history of medical procedures for accurate health tracking.',
                  size: 14,
                  textAlign: TextAlign.start),
              Widgets.heightSpaceH2,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient:  LinearGradient(
                    colors: [
                      ColorConstants.gradient1,
                      ColorConstants.gradient2
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textBold('Your Medical Procedures',
                        size: 18, textAlign: TextAlign.start),
                    Widgets.heightSpaceH1,
                    Texts.textNormal("You haven't added any medical conditions yet. Add conditions from the list below or enter your own.",textAlign: TextAlign.start,size: 14),

                  ],
                ),
              ),
              Widgets.heightSpaceH3,
              Texts.textBold('Add Custom Condition', size: 18),
              Widgets.heightSpaceH1,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: EntryField(
                      hint: 'Procedure Name',

                    ),
                  ),
                  Widgets.widthSpaceW2,
                  Expanded(
                    child: CustomButton(
                      backgroundColor: ColorConstants.darkPrimaryColor,
                      label: "Add",
                      textColor: ColorConstants.whiteColor,
                    ),
                  ),
                ],
              ),
              Widgets.heightSpaceH1,
              Texts.textBold('Common Conditions', size: 18),
              Widgets.heightSpaceH05,
              EntrySearchField(prefixIcon: Assets.searchbarIcon,hint: "",),
              Widgets.heightSpaceH05,
              Column(children: List.generate(5, (int index)=>Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.0),
                child: MealBoxWidget(title: conditonList[index], prefixIcon: Assets.telescopIcon),
              ))),
        
            ],
          ),
        ),
      ),
    );
  }
}
