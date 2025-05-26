import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/routes/app_routes.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_tracker/add_custom_medication.dart';

class AddMedicationMedication extends StatelessWidget {
  const AddMedicationMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.whiteColor,
          ),
        ),
        Container(
          height: 1000.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                stops: [
                  0.0,
                  0.7,
                  0.8,
                  1.0
                ],
                colors: [
                  ColorConstants.hrtTrackerGradient1,
                  ColorConstants.hrtTrackerGradient2,

                  ColorConstants.hrtTrackerGradient2.withAlpha(
                      (0.4 * 255).toInt()), // Smoothly fade to white background
                  Colors.white,
                ]),
          ),
        ),

        Scaffold(
          backgroundColor: ColorConstants.transparentColor,
          appBar: AppBar(

            elevation: 0,scrolledUnderElevation: 0,backgroundColor: Colors.transparent,),
          body: Padding(
            padding: PaddingConstants.screenPaddingHalf,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Texts.textBold("Add Medication",size: 20),
                Widgets.heightSpaceH1,
                Texts.textNormal("Add a medication that’s not in our database. You can  also include a photo so we can add it for future users.",textAlign: TextAlign.start,size: 14),
                  Widgets.heightSpaceH1,
                  Widgets.divider(),
                  Widgets.heightSpaceH1,
                 CustomDropdown(onTap: (){}, value: "Estrogen medications", hint: "Estrogen medications", label: "Category",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
                  Widgets.heightSpaceH05,
                  CustomDropdown(onTap: (){}, value: "Ovestin Cream", hint: "", label: "Medication",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
                  Widgets.heightSpaceH1,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(16),
                      border: Border.all(color: ColorConstants.darkPrimaryColor),
                    ),
                    child: Padding(
                      padding: PaddingConstants.screenPaddingHalf,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Image.asset(Assets.infoIcon,width: 20,height: 20,),
                        Widgets.widthSpaceW1
                          ,
                        Texts.textBold('Dosage Information',size: 18,color: ColorConstants.primaryColor),
                      ],),
                          Widgets.heightSpaceH1,
                          RichText(text: TextSpan(text: 'Initial dose: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),children: [
                            TextSpan(text: 'Apply 1 applicatorful (0.5 mg estriol) daily for the first 2 to 3 weeks. Maintenance dose: After initial treatment, reduce to 1 applicatorful twice a week.',style: TextStyle(fontWeight: FontWeight.normal)),

                          ])),

                        ],
                      ),
                    ),
                  ),
                  Widgets.heightSpaceH1,
                  Widgets.heightSpaceH05,
                  CustomDropdown(onTap: (){}, value: "Initial: 1 applicatorful (0.5 mg estriol) daily", hint: "", label: "Dosage",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
                  Widgets.heightSpaceH05,
                  CustomDropdown(onTap: (){}, value: "Cream", hint: "", label: "Method",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),

                  Widgets.heightSpaceH05,
                  CustomDropdown(onTap: (){}, value: "Initial: 1 applicatorful (0.5 mg estriol) daily", hint: "", label: "Dosage",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),

                  Widgets.heightSpaceH05,
                  CustomDropdown(onTap: (){}, value: "Twice Daily", hint: "", label: "frequency",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
                  Widgets.heightSpaceH05,
                  EntryField(
                    label: 'Start Date',
                    prefixIcon: Assets.calendarIcon,
                    hint: "07/04/2025",
                  ),
                  Widgets.heightSpaceH05,

              EntryBigField(label: 'Additional Notes',hint: "Addition notes  about this medication",),
                  Widgets.heightSpaceH1,
              CustomButton(
                backgroundColor: ColorConstants.darkPrimaryColor,
                label: "Add medication",

              ),
                  Widgets.heightSpaceH2,
                  CustomButton(label: "Add custom medication",borderColor: ColorConstants.blackColor,textColor: ColorConstants.blackColor,onTap: (){
                    Get.toNamed(AppRoutes.addcustomMedication);
                  },)


                ],),
            ),
          ),

        ),
      ],
    );
  }
}
