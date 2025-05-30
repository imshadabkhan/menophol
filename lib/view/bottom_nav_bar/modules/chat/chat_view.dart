import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/mssg_container.dart';
import 'package:menophol/core/widgets/send_message.dart';
import 'package:menophol/core/widgets/text_widgets.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Texts.textBold("Ask The MenoPal",size: 20) ,centerTitle: true, bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: Colors.black,
          height: 1.0,
        ),
      ),),
      body: SafeArea(
        child: Padding(
          padding:PaddingConstants.screenPaddingHalf.copyWith(bottom: 5),
          child: Column(
            children: [



              Expanded(
                child: Column(children: [
                        sendMssgView(color: ColorConstants.primaryColor.withAlpha((0.4*255).toInt()),mssg: "Hello! I'm The MenoPal, your personal menopause assistant. How can I help you today?",),

                  Align(
                      alignment: Alignment.centerRight,
                      child: sendMssgView(color: ColorConstants.whiteColor,mssg: "What Is Menopause?",)),
                  sendMssgView(color: ColorConstants.primaryColor.withAlpha((0.4*255).toInt()),mssg: "Menopause is a natural biological process that marks the end of a woman's menstrual cycles. It is officially diagnosed when a woman has gone 12 months without a period.",),
                  Align(
                      alignment: Alignment.centerRight,
                      child: sendMssgView(color: ColorConstants.whiteColor,mssg: "Gandu?",)),

                ],),
              ),
              SendMessage(),
            ],
          ),
        ),
      ),);
  }
}




