import 'package:flutter/material.dart';
import 'package:menophol/core/widgets/text_widgets.dart';

import '../constants/color_constants.dart';

class RichTextParagraphs extends StatelessWidget {
  const RichTextParagraphs(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Baseline(
            baseline: 13,
            baselineType: TextBaseline.alphabetic,
            child: Texts.textBold("• ", size: 10),
          ),
          Expanded(
            child: RichText(
                text: TextSpan(
                    text: title,
                    style: TextStyle(
                        color: ColorConstants.blackColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        fontSize: 14),
                    children: [
                      TextSpan(
                          text: subTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: ColorConstants.blackColor,
                              fontFamily: "Montserrat")),
                    ])),
          )
        ],
      ),
    );
  }
}