import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class ListTile_Widget extends StatelessWidget {
  const ListTile_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.greyBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(

                      height: 60.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(Assets.image1),
                    ),
                    Widgets.widthSpaceW1,
                    Widgets.widthSpaceW05,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Texts.textBold('Common Menopause Symptoms',
                              textAlign: TextAlign.start,
                              size: 18,
                              maxlines: 2),

                          Widgets.heightSpaceH05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.access_time_sharp,size: 14,),
                                      Widgets.widthSpaceW1,
                                      Texts.textNormal('8 Min Read',size: 13,color: ColorConstants.blackColor)
                                    ],
                                  ),

                                  Widgets.heightSpaceH05,
                                  Texts.textNormal('HSE',color: ColorConstants.blackColor,size: 13),

                                ],
                              ),

                              SvgPicture.asset(Assets.femaleIcon,height: 35,),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}