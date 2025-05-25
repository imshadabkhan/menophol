import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class MealBoxWidget extends StatelessWidget {
  const MealBoxWidget({
    super.key,
    required this.title,required this.prefixIcon
  });
  final String title;
  final String prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorConstants.blackColor,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              prefixIcon,
              width: 20,
              height: 20,
            ),
            Widgets.widthSpaceW2,
            Texts.textMedium(title, size: 15),
            Expanded(child: Widgets.widthSpaceW1),
            Icon(
              Icons.add,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}