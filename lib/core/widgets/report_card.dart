import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [

            Color(0xffF5E1FC),
            Color(0xff97B5FB),
          ]),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Your stress levels have ',style: TextStyle(fontFamily: 'Montserrat',
                  color: ColorConstants.blackColor,fontSize: 14),
              ),
              TextSpan(
                  text: "decreased by 20% ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black,fontSize: 14,fontFamily: 'Montserrat',)),
              TextSpan(
                  text:
                  "this week. Keep up the good work with your relaxation strategies!",
                  style: TextStyle(fontFamily: 'Montserrat',color: ColorConstants.blackColor,fontSize: 14)),
            ],),));
  }
}