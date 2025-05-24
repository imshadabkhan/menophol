import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class DynamicButton extends StatelessWidget {
   DynamicButton({
    super.key,
    required this.title,
     this.icon,
    this.borderColor,
    this.textColor,
  });
  final String title;
   String? icon;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: borderColor??ColorConstants.darkPrimaryColor)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           icon!=null ?Image.asset(
              icon!,
              width: 15,
              height: 15,
            ):Text(""),
            Widgets.widthSpaceW1,
            Texts.textNormal(title,
                color: textColor??ColorConstants.blackColor, size: 12,maxLines: 2,textAlign: TextAlign.start),
          ],
        ),
      ),
    );
  }
}