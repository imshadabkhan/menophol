import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/controller.dart';

class PastEntries extends StatefulWidget {
  const PastEntries({super.key});

  @override
  State<PastEntries> createState() => _PastEntriesState();
}

class _PastEntriesState extends State<PastEntries> {
  @override
  final SymptomsController controller = Get.put(SymptomsController());
  List<String> triggers=["Exercise",'Sleep Changes','Temperature',"Weather Changes"];
  List<String> trigger2=["Exercise",'Temperature',"Weather Changes"];
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: ListView(children: [
          EntryField(
            prefixIcon: Assets.calendarIcon,
            hint: "07/04/2025",
          ),

          PastEntryCards(triggers: triggers,title: "Anxiety",label: 'High Severity',controller: controller,),
          PastEntryCards(triggers: trigger2,title: 'Sleep Issues',label:"Very Severe" ,labelColor: ColorConstants.redTextColor,controller: controller,subtitleBgColor: ColorConstants.primaryColor.withAlpha((0.4*255).toInt()),),

        ],),
      ),
    );
  }
}

class PastEntryCards extends StatelessWidget {
  const PastEntryCards({
    super.key,
    required this.triggers,
    required this.title,
    required this.label,
    this.subtitleBgColor,
     this.labelColor,this.controller
  });

  final List<String> triggers;
final String title;
  final String label;
  final Color? labelColor;
  final Color? subtitleBgColor;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.greyBorderColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Texts.textBold(title,size: 18,textAlign: TextAlign.start),

                Image.asset(Assets.deleteIcon,height: 15,),

              ],),
              Widgets.heightSpaceH1,
              Container(
                decoration: BoxDecoration(
                    color: subtitleBgColor??ColorConstants.greyBgColor,
                    borderRadius: BorderRadius.circular(4),

                ),
                child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),child: Texts.textNormal(label,color:labelColor?? ColorConstants.goldenColor,size: 12),),),
              Widgets.heightSpaceH1,
              Widgets.divider(),
              Widgets.heightSpaceH2,
      Texts.textBold("Triggers",size: 16),
              Widgets.heightSpaceH1,
              Wrap(
                direction:Axis.horizontal,
                children: List.generate( triggers.length, (index){
                  final label = triggers[index];
                  final sectionKey = "${label}triggers'";


                  return Padding(
                    padding: const EdgeInsets.only(top:4,right: 8,bottom: 4),
                    child: Obx(() => RadioBtnWithTextChip(
                      label: label,
                      isSelected: controller.isSelected(sectionKey, label),
                      onTap: () => controller.toggleTrigger(sectionKey, label),
                    )),                            );}),),

            ],
          ),
        ),
      ),
    );
  }
}
