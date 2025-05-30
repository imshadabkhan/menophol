import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
            Texts.textBold('Change Password',size: 20),
            Widgets.heightSpaceH1
            ,
            Texts.textNormal("Update your account password",size: 14),
            Widgets.heightSpaceH1,
            Widgets.divider(),
            Widgets.heightSpaceH1,
            EntryField(label: "Current Password",),
            Widgets.heightSpaceH1,
            EntryField(label: "New Password",),
            Widgets.heightSpaceH1,
            EntryField(label: "Confirm New Password",),
            Widgets.heightSpaceH1,
            CustomButton(
              label: 'Update password',
              backgroundColor: ColorConstants.darkPrimaryColor,
            ),



          ],

        ),
      ),

    );
  }
}
