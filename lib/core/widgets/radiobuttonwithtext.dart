import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class RadioBtnWithTextChip extends StatelessWidget {
  const RadioBtnWithTextChip({
    super.key,
    required this.label,
    required this.isSelected
  });
  final String  label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyBorderColor),
        color:ColorConstants.chipBGColor,

        borderRadius: BorderRadius.circular(8),

      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),child: Row(
        mainAxisSize:MainAxisSize.min,

        children: [
          InkWell(
            onTap:(){},
            child:  Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: isSelected
                    ? Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                )
                    : null,
              ),
            ),
          ),
          Widgets.widthSpaceW1,
          Texts.textNormal(label,size: 12),
        ],)),
    );
  }
}