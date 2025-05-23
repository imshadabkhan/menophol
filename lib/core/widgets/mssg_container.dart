import 'package:flutter/material.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';

class sendMssgView extends StatelessWidget {
  const sendMssgView({
    super.key,required this.color,
    required this.mssg
  });
  final Color color;
  final String mssg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
        child: Padding(padding: PaddingConstants.contentPadding,child: Texts.textNormal(mssg,textAlign: TextAlign.left,size: 14,maxLines: 5),
        ),
      ),
    );
  }
}