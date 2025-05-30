import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class HomeScreenCards extends StatelessWidget {
  const HomeScreenCards({
    super.key,
    required this.icon,required this.text
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(width: 90,height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:ColorConstants.greyBorderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(

                    color: ColorConstants.primaryColor.withAlpha((0.3 * 255).toInt()),
                  shape: BoxShape.circle,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    icon,
                    height: 22,
                  ),
                ),
              ),
              Widgets.heightSpaceH1,
              Flexible(child:Texts.textNormal(text, size: 8,maxLines: 1,overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    );
  }
}