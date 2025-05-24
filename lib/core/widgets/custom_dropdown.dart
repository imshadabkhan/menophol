
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:menophol/core/widgets/text_widgets.dart';


import '../constants/color_constants.dart';

class CustomDropdown extends StatelessWidget {
   CustomDropdown({
    super.key,
    required this.onTap,
    required this.value,
    required this.hint,
    required this.label,
     this.color,
     this.iconColor
  });


  final Callback? onTap;
  final String? value;
  final String? hint;
  final String? label;
  final Color? color;
   Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Texts.textBlock(fontWeight: FontWeight.w600,
              label??"",
            size: 10,
            ),

          ],
        ),
        const SizedBox(
          height: 7,
        ),
        GestureDetector(
            onTap:onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: color??ColorConstants.darkPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 0.5,
                  color: ColorConstants.greyBorderColor)

              ),
              height: 45,
              width: 1.sw,
              child: Row(
                children: [
                  Expanded(
                    child: Texts.textNormal(
                        textAlign: TextAlign.start,
                      size: 14,
                        value ?? hint!,color:
                        value == null
                            ? Colors.red
                            : ColorConstants.blackColor),
                  ),
                  const SizedBox(width: 10,),
                   Icon(Icons.keyboard_arrow_down_outlined,color: iconColor??Colors.white,size: 18,)
                ],
              ),
            )),const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
class CustomDropdown2 extends StatelessWidget {
  const CustomDropdown2({
    super.key,
    required this.onTap,
    required this.value,
    required this.hint,
    required this.label
  });


  final Callback? onTap;
 final String? value;
  final String? hint;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black87,
                  fontSize: 13,
                  fontFamily: "LatoRegular"),
            ),

          ],
        ),
        const SizedBox(
          height: 7,
        ),
        GestureDetector(
            onTap:onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: ColorConstants.grayColor,
                  borderRadius: BorderRadius.circular(10)),
              height: 45,
              width: 1.sw,
              child: Row(
                children: [
                  Expanded(
                    child: Texts.textBlock(fontWeight: FontWeight.w300,size: 10,
                        value ?? hint!,color:
                        value == null
                            ? Colors.grey
                            : Colors.black87),
                  ),
                  const SizedBox(width: 10,),
                  Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black54,size: 18,)
                ],
              ),
            )),const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
