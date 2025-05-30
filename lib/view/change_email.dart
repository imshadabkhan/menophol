import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
appBar: AppBar(elevation: 0,scrolledUnderElevation: 0,backgroundColor: ColorConstants.whiteColor,),
      body: Padding(
        padding:PaddingConstants.screenPaddingHalf,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Texts.textBold('Change Email',size: 20),
            Widgets.heightSpaceH05,
            Texts.textNormal("Change your email address",size: 14),
            Widgets.heightSpaceH2,
            Widgets.divider(),
            Widgets.heightSpaceH2,
            EntryField(label: "New Email Address",),
            Widgets.heightSpaceH2,
            CustomButton(
              label: 'Update email',
              backgroundColor: ColorConstants.darkPrimaryColor,
            ),



          ],

        ),
      ),

    );
  }
}
