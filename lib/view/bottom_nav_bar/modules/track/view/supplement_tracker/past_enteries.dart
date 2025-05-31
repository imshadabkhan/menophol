import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class PastEnteries extends StatelessWidget {
  const PastEnteries({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(children: [
          PastEntrySupplementCard(title: 'Vitamin D',dosageNo: '1',),
          Widgets.heightSpaceH2,
          PastEntrySupplementCard(title: 'Magnesium',dosageNo: '4',),


        ],),
      ),

    );
  }
}

class PastEntrySupplementCard extends StatelessWidget {
  const PastEntrySupplementCard({
    super.key,
    required this.title,
    required this.dosageNo,
  });
 final String title;
 final String dosageNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
    color: ColorConstants.whiteColor,

        border: Border.all(color: Colors.black.withAlpha((0.1*255).toInt())),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
              Texts.textBold(title,size: 14),
              Image.asset(Assets.deleteIcon,height: 18,width: 18,),
            ],),
            Widgets.heightSpaceH1,
            Texts.textMedium("Dosage",size: 12),
            Widgets.heightSpaceH05,
            Texts.textNormal(dosageNo,size: 12),
          ],
        ),
      ),
    );
  }
}
