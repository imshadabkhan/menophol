import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class PastEntries extends StatefulWidget {
  const PastEntries({super.key});

  @override
  State<PastEntries> createState() => _PastEntriesState();
}

class _PastEntriesState extends State<PastEntries> {
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
          PastEntryCards(triggers: triggers,title: "Anxiety",label: 'High Severity',),
          PastEntryCards(triggers: trigger2,title: 'Sleep Issues',label:"Very Severe" ,labelColor: ColorConstants.redColor,),

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
     this.labelColor,
  });

  final List<String> triggers;
final String title;
  final String label;
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

                Image.asset(Assets.deleteIcon,height: 20,),

              ],),
              Widgets.heightSpaceH1,
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.greyBgColor,
                    borderRadius: BorderRadius.circular(8),

                ),
                child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),child: Texts.textNormal(label,color:labelColor?? ColorConstants.goldenColor,size: 14),),),
              Widgets.heightSpaceH1,
              Widgets.divider(),
              Widgets.heightSpaceH1,
      Texts.textBold("Triggers",size: 22),
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
