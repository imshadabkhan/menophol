import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class AddCustomMedication extends StatelessWidget {
  const AddCustomMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(elevation: 0,scrolledUnderElevation: 0,backgroundColor: Colors.transparent,),
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texts.textBold("Add Custom HRT Medication",size: 22),
              Widgets.heightSpaceH1,
              Texts.textNormal("Add a medication that's not in our database. Include a photo of the medication bottle to help us add it to our database for future users.",textAlign: TextAlign.start,size: 14),
              Widgets.heightSpaceH1,
              Widgets.divider(),
              Widgets.heightSpaceH1,
              Widgets.heightSpaceH1,
              CustomDropdown(onTap: (){}, value: "Estrogen medications", hint: "", label: "Medication Name*",color:Colors.white,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH05,
              CustomDropdown(onTap: (){}, value: "e.g, 1mg,2mg", hint: "", label: "Dosage",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH1,
              CustomDropdown(onTap: (){}, value: "select method", hint: "", label: "Method of Administration*",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH1,
              CustomDropdown(onTap: (){}, value: "Daily", hint: "", label: "Frequency",color:ColorConstants.whiteColor,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH1,
              EntryField(
                label: "Patient Information Leaflet Link(optional)",
                hint: "e.g http//www.medicines.org.uk/emc..",

              ),
             Texts.textNormal("Enter a link to the medication's Patient Information Leaflet(PIL) if available.",size: 14,textAlign: TextAlign.start),
              Widgets.heightSpaceH2,

              EntryBigField(hint:"Enter detailed information about dosing instructions, e.g., 'Initial dose: Apply once daily for first 2 weeks. Maintenance: Apply twice weekly." ,label:"Detailed Dosage Information (optional)" ,),
              Widgets.heightSpaceH1,
           EntryField(label: "Start Date",prefixIcon: Assets.calendarIcon,hint: "07/04/2025",),
              Widgets.heightSpaceH1,
              Texts.textMedium("Upload Medication Image(optional)",size: 14),
              Widgets.heightSpaceH1,
              DottedBorder(
                color: ColorConstants.primaryColor,
                strokeWidth: 2,
                dashPattern: [6, 3], // 6 units line, 3 units space
                borderType: BorderType.RRect, // rounded corners
                radius: Radius.circular(8),
                child: Container(


                  alignment: Alignment.center,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(Assets.uploadPhoto,height: 20,width: 20,),
                        Widgets.widthSpaceW1,
                        Texts.textMedium(
                          'Upload Photo',
                          size: 14,
                          color: ColorConstants.darkPrimaryColor

                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Widgets.heightSpaceH1,
              Texts.textNormal("Upload a photo of your medication bottle or packaging to help us add this medication to our database.",size: 12,textAlign: TextAlign.start),

              Widgets.heightSpaceH1,
              EntryBigField(label:"Additional Notes" ,hint:"Additional notes about this medication" ,),
              Widgets.heightSpaceH1,
              CustomButton(
                backgroundColor: ColorConstants.darkPrimaryColor,
                label: "save custom medication",

              ),



            ],),
        ),
      ),

    );
  }
}
