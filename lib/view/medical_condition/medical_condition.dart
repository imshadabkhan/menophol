import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/meal_box_widget.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/medical_condition/controller.dart';




class MedicalConditionView extends StatelessWidget {
   MedicalConditionView({super.key,});

   MedicalConditionController controller=Get.put(MedicalConditionController());
  final List<String> conditonList=[
    "Thyroid Disorder","Hypertension",'Osteoporosis',"Anxiety","Hypertension","Migraine","Asthama"

  ];




  TextEditingController customConditionController=Get.put(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.whiteColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: PaddingConstants.screenPaddingHalf.copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.textBold('Medical Conditions', size: 18),
                Widgets.heightSpaceH05,
               Texts.textNormal(
                    'Review and update your history of medical procedures for accurate health tracking.',
                    size: 12,
                    textAlign: TextAlign.start),
                Widgets.heightSpaceH2,
                Obx(()=> Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texts.textBold('Your Medical Conditions',
                            size: 18, textAlign: TextAlign.start),
                        Widgets.heightSpaceH2,
                        controller.customConditionList.isEmpty? Texts.textNormal("You haven't added any medical conditions yet. Add conditions from the list below or enter your own.",textAlign: TextAlign.start,size: 12):
                        Wrap(
                          spacing: 6,
                          direction: Axis.horizontal,
                          children: List.generate(controller.customConditionList.length, (int index){
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.whiteColor,
                                  border: Border.all(color: ColorConstants.greyBorderColor,width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Texts.textNormal(controller.customConditionList[index],size: 12),Widgets.widthSpaceW1,GestureDetector(
                                          onTap: (){
                                            controller.customConditionList.removeAt(index);
                                          },
                                          child: Image.asset(Assets.removeIcon,height: 13,width: 13,)),
                                    ],),
                                ),


                              ),
                            );
                          },),


                        ),

                      ],
                    ),
                  ),
                ),),

                Widgets.heightSpaceH3,
                Texts.textBold('Add Custom Condition', size: 18),
                Widgets.heightSpaceH1,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: EntryField(
                        hint: 'Procedure Name',
                        controller: customConditionController,

                      ),
                    ),
                    Widgets.widthSpaceW2,
                    Expanded(
                      child: CustomButton(
                        backgroundColor: ColorConstants.darkPrimaryColor,
                        label: "Add",
                        textColor: ColorConstants.whiteColor,
                        onTap: (){

                          controller.customConditionList.add(customConditionController.text.toString());
                          customConditionController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ],
                ),
                Widgets.heightSpaceH1,
                Texts.textBold('Common Conditions', size: 18),
                Widgets.heightSpaceH05,
                EntrySearchField(prefixIcon: Assets.searchbarIcon,hint: "Search Conditions",),
                Widgets.heightSpaceH05,
                Column(children: List.generate(5, (int index)=>Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.0),
                  child: Obx(()=>MealBoxWidget(title: conditonList[index], prefixIcon: Assets.telescopIcon,suffixIcon:controller.customConditionList.contains(conditonList[index])?Assets.addedIcon:null,trailingTap:(){
                    controller.addSymptomToList(conditonList[index].toString());
                  }),),
                ),),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
