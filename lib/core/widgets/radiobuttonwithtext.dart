import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class RadioBtnWithTextChip extends StatelessWidget {
  const RadioBtnWithTextChip({
    super.key,
    required this.label
  });
  final String  label;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyBorderColor),
        color:ColorConstants.greyBgColor,

        borderRadius: BorderRadius.circular(8),

      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),child: Row(
        mainAxisSize:MainAxisSize.min,

        children: [
          InkWell(
            onTap:(){},
            child: Container(
              alignment: Alignment.center,
              width: 12.w,height: 12.h,
              decoration: BoxDecoration(
                color: ColorConstants.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.black,
                    width: 1
                ),

              ),

            ),
          ),
          Widgets.widthSpaceW1,
          Texts.textNormal(label,size: 16),
        ],)),
    );
  }
}