import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ConversationBlock extends StatelessWidget {
  const ConversationBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ Color(0xfff2e9f8),
            Color(0xffb5e7fc),


          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Texts.textBold(
            'Ask The Menopal',
            size: 17,
          ),
          Widgets.heightSpaceH1,
          Texts.textNormal(
              'Struggling with symptoms, weight, or sleep? Let’s work it out together.',
              size: 13,
              textAlign: TextAlign.center),
          Widgets.heightSpaceH2,
          CustomButton(fontSize: 11,
            label: "Start a conversation",
            textStyle: TextStyle(color: Colors.white),
            backgroundColor: ColorConstants.darkPrimaryColor,
          ),
        ],
      ),
    );
  }
}