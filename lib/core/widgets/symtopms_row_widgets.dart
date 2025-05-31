import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SypmtomRowWidget extends StatelessWidget {
   SypmtomRowWidget({
    super.key,

    this.title,
    this.height,
    this.width,
    this.baseline,
    this.color,


  });

  final  String? title;
  final double? height;
  final  double? width;
  final  double? baseline;
  var color;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,



        children: [
          Baseline(
            baseline: baseline??12,
            baselineType: TextBaseline.alphabetic,
            child: Container(
              height: height??15,width: width??15,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: color??Colors.grey),),
          ),
          Widgets.widthSpaceW1,
          Flexible(child:Texts.textNormal(title.toString(),textAlign: TextAlign.start,size: 12,textBaseline: TextBaseline.alphabetic,overflow: TextOverflow.ellipsis,maxLines: 2),
          ),
        ]
    );
  }
}