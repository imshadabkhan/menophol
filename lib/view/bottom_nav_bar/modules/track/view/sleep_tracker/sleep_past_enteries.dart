import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SleepPastEnteries extends StatefulWidget {
  const SleepPastEnteries({super.key});

  @override
  State<SleepPastEnteries> createState() => _SleepPastEnteriesState();
}

class _SleepPastEnteriesState extends State<SleepPastEnteries> {
  @override
  List<String> triggers=["Exercise",'Sleep Changes','Temperature',"Weather Changes"];
  List<String> trigger2=["Exercise",'Temperature',"Weather Changes"];
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(children: [
          EntryField(
            prefixIcon: Assets.calendarIcon,
            hint: "07/04/2025",
          ),
          Widgets.heightSpaceH05,
          PastEntryCards(triggers: triggers,title: "Good Sleep",icon:Assets.unfilledHappy,),
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
  });

  final List<String> triggers;
  final String title;
  final String icon;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
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
                  Texts.textBold(title,size: 22,textAlign: TextAlign.start),
                  Widgets.widthSpaceW1,
                  Image.asset(icon,height: 20,width: 20,),
                  Expanded(child:  Widgets.widthSpaceW1,),
                  Image.asset(Assets.deleteIcon,height: 20,),

                ],),

              Texts.textNormal("5/10",size: 12,color: ColorConstants.grayColor),
              Widgets.heightSpaceH1,

              Widgets.heightSpaceH1,
              Widgets.divider(),
              Widgets.heightSpaceH1,
              Row(

                children: [

                Column(

                  crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                  Texts.textBold("Duration",size: 16),
                  Widgets.heightSpaceH05,
                  Texts.textNormal("8 hours",size: 14)

                ],),
                Widgets.widthSpaceW4,
                  Widgets.widthSpaceW4,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Texts.textBold("Times Awake",size: 16),
                  Widgets.heightSpaceH05,
                  Texts.textNormal("0",size: 14),

                ],),

              ],),
              Widgets.heightSpaceH2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts.textBold("Notes",size: 16),
                  Widgets.heightSpaceH05,
                  Texts.textNormal("Lorem ipsum dolor sit amet consectetur",size: 14,textAlign: TextAlign.start),
                  Widgets.heightSpaceH1,
                  Texts.textBold("Triggers",size: 16),
                  Widgets.heightSpaceH05,
                  Wrap(
                    direction:Axis.horizontal,
                    children: List.generate(1, (index)=> Padding(
                      padding: const EdgeInsets.all(4.0).copyWith(left: 0),
                      child: RadioBtnWithTextChip(isSelected:false,label:"Exercise"),
                    ),),),

                ],),


            ],
          ),
        ),
      ),
    );
  }
}
