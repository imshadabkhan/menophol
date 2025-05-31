import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/mood_tracker/controller.dart';

class MoodPastEntries extends StatefulWidget {
  const MoodPastEntries({super.key});

  @override
  State<MoodPastEntries> createState() => _MoodPastEntriesState();
}

class _MoodPastEntriesState extends State<MoodPastEntries> {
  @override
  final MoodController controller = Get.put(MoodController());
  List<String> triggers=["Exercise",'Sleep Changes','Temperature',"Weather Changes"];
  List<String> trigger2=["Exercise",'Temperature',"Weather Changes"];
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(children: [
          Widgets.heightSpaceH1,
          EntryField(
            prefixIcon: Assets.calendarIcon,
            hint: "07/04/2025",
          ),
          Widgets.heightSpaceH1,
          PastEntryCards(triggers: triggers,title: "Happy",icon:Assets.unfilledHappy,controller:controller,),
          // PastEntryCards(triggers: trigger2,title: 'Sleep Issues',label:"Very Severe" ,labelColor: ColorConstants.redColor,),

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
    required this.icon,
    this.labelColor,
    this.controller
  });

  final List<String> triggers;
  final String title;
  final String icon;
  final Color? labelColor;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorConstants.greyBorderColor),
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
                  Widgets.widthSpaceW1,
                  Image.asset(icon,height: 20,width: 20,),
                  Expanded(child:  Widgets.widthSpaceW1,),
                  Image.asset(Assets.deleteIcon,height: 16,),

                ],),
              Widgets.heightSpaceH1,
              // Container(
              //   decoration: BoxDecoration(
              //     color: ColorConstants.greyBgColor,
              //     borderRadius: BorderRadius.circular(8),
              //
              //   ),
              //   child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),child: Texts.textNormal(label,color:labelColor?? ColorConstants.goldenColor,size: 14),),),
              Widgets.heightSpaceH1,
              Widgets.divider(),
              Widgets.heightSpaceH2,
              Texts.textBold("Triggers",size: 16),
              Widgets.heightSpaceH1,

              Wrap(
                children: List.generate(triggers.length, (index) {
                  final label = triggers[index];
                  final sectionKey = "${label}_LifeStylee";

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => RadioBtnWithTextChip(
                      label: label,
                      isSelected: controller.isSelected(sectionKey, label),
                      onTap: () => controller.toggleTrigger(sectionKey, label),
                    )),
                  );
                }),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
