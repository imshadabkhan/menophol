import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SymptomsSeverityRowWidget extends StatelessWidget {
  const SymptomsSeverityRowWidget({
    super.key,
    required this.colorList,
    required this.title,
    required this.icon
  });

  final List<Color> colorList;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(icon,height: 18,width: 18,),
                Widgets.widthSpaceW1,
                Expanded(child: Texts.textNormal(title,size: 12,textAlign: TextAlign.start,),)
              ],),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(colorList.length, (int index) =>  Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                width: 30.w,
                height: 14.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color:colorList[index]
                ),
              ),
            ),),),

        ],),
    );
  }
}