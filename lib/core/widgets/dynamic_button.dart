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
     this.bgColor,
     this.onTap,this.padding,this.size
  });
  final String title;
   String? icon;
  final Color? borderColor;
  final Color? textColor;
   final Color? bgColor;
    GestureTapCallback? onTap;
    var padding;
    var size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,

      child: Container(
        decoration: BoxDecoration(
          color: bgColor??ColorConstants.transparentColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: borderColor??ColorConstants.darkPrimaryColor)
        ),
        child: Padding(
          padding: padding??const EdgeInsets.all(8.0),
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
                  color: textColor??ColorConstants.blackColor, size:size?? 12,maxLines: 2,textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}