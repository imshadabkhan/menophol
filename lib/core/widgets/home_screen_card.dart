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
      height: 120.h,
      width: 110.w,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
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
                  color: ColorConstants.primaryColor.withAlpha((0.5 * 255).toInt()),
                  shape: BoxShape.circle,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    icon,
                    height: 19.h,
                  ),
                ),
              ),
              Widgets.heightSpaceH1,
              Texts.textNormal(text, size: 10),
            ],
          ),
        ),
      ),
    );
  }
}