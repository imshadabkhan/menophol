import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/editprofile/controller.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});
  final int selectedOption = 0;
   final ProfileController controller = Get.put(ProfileController());


   final List<String> options = [
    'Required Data Processing',
    'Marketing Communications',
    'Third-Party Data Sharing',
    'Health Research Participation',
  ];
   String _getDescription(int index) {
     switch (index) {
       case 0:
         return "We need to process your personal data to provide our core health tracking services. This is required to use the application.";
       case 1:
         return "Receive updates about new features, health tips, and promotions via email.";
       case 2:
         return "Allow us to share anonymized data with trusted third parties for service improvement.";
       case 3:
         return "Contribute your anonymized health data to research studies to advance women’s health science.";
       default:
         return "";
     }
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(elevation: 0,scrolledUnderElevation: 0,backgroundColor: ColorConstants.whiteColor,),
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf.copyWith(top: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Texts.textBold("Edit Profile",size: 20),
            Widgets.heightSpaceH05,
            Texts.textNormal("Update your personal information and keep your profile up to date.",textAlign: TextAlign.start,size: 14),
            Widgets.heightSpaceH1,
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(radius: 40, backgroundImage: AssetImage(Assets.profileImg),),
                  CircleAvatar(radius: 12,backgroundColor: ColorConstants.darkPrimaryColor,

                  child: Icon(Icons.camera_alt_outlined,color: ColorConstants.whiteColor,size: 12,),
                  ),
          
                ],
              ),
            ),
            Widgets.heightSpaceH1,
            EntryField(
              label: "Name", hint: "Freddy",
            ),
            Widgets.heightSpaceH05,
            EntryField(
              label: "Last Name", hint: "Mercury",
            ),
              Widgets.heightSpaceH05,
            EntryField(
              label: "Email Address", hint: "fred@example.com",
            ),
              Widgets.heightSpaceH05,
              EntryField(
              label: "Date Of Birth", hint: "Freddy",
              prefixIcon: Assets.calendarIcon,
            ),
              Widgets.heightSpaceH05,
              CustomDropdown(onTap: (){}, value: '', hint: 'United States', label: 'Country',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH05,
              CustomDropdown(onTap: (){}, value: '', hint: 'e.g New York', label: 'City',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH05,
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomDropdown(onTap: (){}, value: '', hint: '0', label: 'Height',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,)),
          Widgets.widthSpaceW2,
                  Expanded(child: CustomDropdown(onTap: (){}, value: '', hint: 'cm', label: '',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,)),
          
          
                ],
              ),
              Widgets.heightSpaceH05,
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomDropdown(onTap: (){}, value: '', hint: '0', label: 'Weight',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,)),
                  Widgets.widthSpaceW2,
                  Expanded(child: CustomDropdown(onTap: (){}, value: '', hint: 'kg', label: '',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,)),


                ],
              ),
              Widgets.heightSpaceH05,
              CustomDropdown(onTap: (){}, value: '', hint: 'Select your identity', label: 'Ethnicity',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,),
Texts.textNormal('This information helps us provide more personalized insights about your health.',size: 14,textAlign: TextAlign.start),
Widgets.heightSpaceH1,
              CustomDropdown(onTap: (){}, value: '', hint: 'select your dietary preference', label: 'Dietary Preference',color: ColorConstants.transparentColor,iconColor: ColorConstants.blackColor,),
              Widgets.heightSpaceH05,
              Texts.textNormal(
                  size: 14,textAlign: TextAlign.start,
                  "This helps us suggest appropriate food options for managing menopause symptoms",)
             , Widgets.heightSpaceH1,
              CustomButton(label: "Save changes",textColor: ColorConstants.whiteColor,backgroundColor: ColorConstants.darkPrimaryColor,),
           Widgets.heightSpaceH2,
              Texts.textBold('Privacy Setting',size: 18),
              Widgets.heightSpaceH1,

             ...List.generate(options.length, (index) {
                return Obx(() {
                  bool isSelected = controller.selectedOption.value == index;

                  return GestureDetector(
                    onTap: () => controller.selectOption(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? ColorConstants.darkPrimaryColor
                              : Colors.grey.shade300,
                          width: isSelected ? 1 : 0.5,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Baseline(
                            baseline: 22,
                            baselineType: TextBaseline.alphabetic,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? ColorConstants.primaryColor
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? null
                                    : Border.all(color: ColorConstants.greyBorderColor),
                              ),
                              child: isSelected
                                  ? Icon(Icons.check, color: Colors.white, size: 16)
                                  : null,
                            ),
                          ),
                          Widgets.widthSpaceW2,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Baseline(
                                  baseline: 16,
                                  baselineType: TextBaseline.alphabetic,
                                  child: Texts.textBold(options[index], size: 16),
                                ),
                                Widgets.heightSpaceH05,
                                Texts.textNormal(
                                  _getDescription(index),
                                  size: 12,
                                  textAlign: TextAlign.start,
                                  maxLines: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }),



              Widgets.heightSpaceH1,
              CustomButton(
                label: "Update privacy settings",

                backgroundColor: ColorConstants.darkPrimaryColor,
                textColor: Colors.white,
              ),

             Widgets.heightSpaceH2,
               Texts.textBold(
                "Data Management",size: 18

              ),
             Widgets.heightSpaceH05,
               Texts.textNormal(
                 size: 14,textAlign: TextAlign.start,
                "Under GDPR, you have the right to access, export, and delete your personal data.",
              ),
             Widgets.heightSpaceH2,

              CustomButton(
                icon: Image.asset(Assets.exportIcon,height: 20,width: 20,),
      label: "Export my data",

                backgroundColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
              ),

              Widgets.heightSpaceH1,
               Widgets.divider(),
              Widgets.heightSpaceH1,
               Texts.textNormal(
                "Delete your account and all associated data. This action cannot be undone.",
                 size: 14,textAlign: TextAlign.start

              ),  Widgets.heightSpaceH1,

              CustomButton(
                label: "Delete my account",

                backgroundColor: ColorConstants.redTextColor,
                icon: Image.asset(Assets.deleteAccount,color: ColorConstants.whiteColor,height: 20,width: 20,),
                textColor: Colors.white,
              ),



            ],),
        ),
      ),
    );
  }
}





