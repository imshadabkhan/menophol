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
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.blueAccent,
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
            size: 22,
          ),
          Widgets.heightSpaceH05,
          Texts.textNormal(
              'Struggling with symptoms, weight, or sleep? Let’s work it out together.',
              size: 16,
              textAlign: TextAlign.center),
          Widgets.heightSpaceH1,
          CustomButton(
            label: "Start a conversation",
            textStyle: TextStyle(color: Colors.white),
            backgroundColor: ColorConstants.primaryColor,
          ),
        ],
      ),
    );
  }
}