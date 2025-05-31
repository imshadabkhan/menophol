import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_dropdown.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/medical_procedure/controller.dart';
import 'package:menophol/view/medical_procedure/model.dart';

  



class MedicalProcedureScreen extends StatelessWidget {
  MedicalProcedureScreen({super.key});
  MedicalProcedureController controller=Get.put(MedicalProcedureController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final List<String> procedureTypes = ['Surgery', 'Check-up', 'Therapy'];
  final RxString selectedType = ''.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.textBold('Medical Procedures', size: 18),
                Widgets.heightSpaceH05,
                Texts.textNormal(
                  'Review and update your history of medical procedures for accurate health tracking.',
                  size: 12,
                  textAlign: TextAlign.start
                ),
                Widgets.heightSpaceH2,
      Obx(()=> Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFE4DDFD),
          Color(0xFFC5E6F7),
        ],
      ),
        ),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texts.textBold('Your Medical Procedures',size: 18,textAlign: TextAlign.start),
        Widgets.heightSpaceH1,
        controller.proceduresList.isEmpty? Texts.textNormal("You haven't added any medical procedures yet. Use the form below to record your medical procedures.",textAlign: TextAlign.start,size: 12):Column(spacing:6,children:List.generate(controller.proceduresList.length, (int index){
          return ProcedureContainer(
            index: index,
            controller: controller,
            procedure:nameController.text.toString(), date: dateController.text.toString(), type: 'Surgery',);
        }),
        ),
      ],
        ),
      ),),


                Widgets.heightSpaceH3,
                Texts.textBold('Add a Medical Procedure', size: 18),
                Widgets.heightSpaceH2,
                EntryField(
                  hint: 'Procedure Name',
                  controller: nameController,
                  label: 'Procedure Name',
                ),
                Widgets.heightSpaceH2,
               CustomDropdown(
                 label: 'Procedure Type',
                  hint: 'Select Procedure ',
                   color: ColorConstants.transparentColor,
                   iconColor: ColorConstants.blackColor,


                   onTap: () {  }, value: '',
                ),
                Widgets.heightSpaceH2,
                EntryField(
                  label: 'Date of Procedure',
                  hint: '07/04/2025',
                  controller: dateController,
                  prefixIcon: Assets.calendarIcon,
                ),
                Widgets.heightSpaceH2,
                EntryBigField(
                  hint: 'Notes (Optional)',
                  label: 'Notes (Optional)',
                  controller: notesController,
                  maxLines: 4,
                ),
                Widgets.heightSpaceH2,
                CustomButton(
                  onTap: (){
                    controller.proceduresList.add(ProcedureModel(name: nameController.text.toString(), type: "Surgery", date: dateController.text.toString()));
nameController.clear();dateController.clear();
                  },
                  label: 'Add procedure',
                  backgroundColor: ColorConstants.darkPrimaryColor,
                  radius: 6.r,
                ),
                Widgets.heightSpaceH2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProcedureContainer extends StatelessWidget {
   const ProcedureContainer({
    super.key,
    required this.procedure,
    required this.type,
    required this.date,
     required this.controller,
     required this.index,

  });
 final String procedure;
  final String type;
  final String date;
  final MedicalProcedureController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffF5F5F5).withAlpha((0.5*255).toInt()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Texts.textBold(procedure.toString(), size: 18,textAlign: TextAlign.start),
                          Widgets.heightSpaceH1,
                          Texts.textNormal(date.toString(), size: 12),


                        ],),

                      Widgets.widthSpaceW1,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryColor.withAlpha((0.3*255).toInt()),
                          border: Border.all(color: ColorConstants.darkPrimaryColor),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(padding: EdgeInsets.all(3),child: Texts.textNormal(type, size: 10, color: ColorConstants.darkPrimaryColor),),
                      ),
                      Expanded(child:  Widgets.widthSpaceW1,),
                      GestureDetector(
                          onTap: (){
                            controller.proceduresList.removeAt(index);

                          },
                          child: Icon(Icons.remove_circle, color: ColorConstants.redTextColor)),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
