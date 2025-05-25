import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class MoodPastEntries extends StatefulWidget {
  const MoodPastEntries({super.key});

  @override
  State<MoodPastEntries> createState() => _MoodPastEntriesState();
}

class _MoodPastEntriesState extends State<MoodPastEntries> {
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
          PastEntryCards(triggers: triggers,title: "Happy",icon:Assets.unfilledHappy,),
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
              Widgets.heightSpaceH1,
              Texts.textBold("Triggers",size: 18),
              Widgets.heightSpaceH1,
              Wrap(
                direction:Axis.horizontal,
                children: List.generate(triggers.length, (index)=> Padding(
                  padding: const EdgeInsets.only(right: 5,top: 5,bottom: 5),
                  child: RadioBtnWithTextChip(isSelected:false,label: triggers[index]),
                ),),),

            ],
          ),
        ),
      ),
    );
  }
}
