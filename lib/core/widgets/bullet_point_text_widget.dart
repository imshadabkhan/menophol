import 'package:flutter/material.dart';
import 'package:menophol/core/widgets/text_widgets.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Baseline(baseline: 16, baselineType: TextBaseline.ideographic,child:   Texts.textBold("\u2022 ",size: 16),),

          Expanded(child: Baseline(baseline: 16, baselineType: TextBaseline.alphabetic,child:Texts.textNormal(text,textAlign: TextAlign.start,size: 16) ,),),

        ],
      ),
    );
  }
}