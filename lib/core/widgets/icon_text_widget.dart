import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.text
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(Assets.tickIcon,height: 20,width: 15,),Widgets.widthSpaceW2,Texts.textNormal(text,size: 15),

      ],);
  }
}