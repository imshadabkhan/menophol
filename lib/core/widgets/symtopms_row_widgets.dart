import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SypmtomRowWidget extends StatelessWidget {
  const SypmtomRowWidget({
    super.key,
    this.color,
    this.title,
    this.height,
    this.width,

  });
  final Color? color;
  final  String? title;
  final double? height;
  final  double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,



        children: [
          Baseline(
            baseline: 15,
            baselineType: TextBaseline.alphabetic,
            child: Container(
              height: height??15,width: width??15,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: color),),
          ),
          Widgets.widthSpaceW1,
          Flexible(child:Texts.textNormal(title.toString(),textAlign: TextAlign.start,size: 14,textBaseline: TextBaseline.alphabetic,overflow: TextOverflow.ellipsis),
          ),
        ]
    );
  }
}