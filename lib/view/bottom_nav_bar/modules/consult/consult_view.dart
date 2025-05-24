import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/doctor_card.dart';

import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
class ConsultView extends StatelessWidget {
  ConsultView({super.key});
  final  specialists = [
    {
      "name": "Dr. Sarah Thompson",
      "specialty": "Menopause Specialist & Gynecologist",
      "location": "London, UK",
      "experience": "15 years experience",
      "rating": "4.9",
      "available": ["In Person", "Online", "Corporate"]
    },
    {
      "name": "Dr. Mary O’Connor",
      "specialty": "Women’s Health Specialist",
      "location": "London, UK",
      "experience": "12 years experience",
      "rating": "4.7",
      "available": ["In Person", "Online"]
    },
    {
      "name": "Dr. James Wilson",
      "specialty": "Endocrinologist",
      "location": "London, UK",
      "experience": "7 years experience",
      "rating": "4.4",
      "available": ["In Person", "Corporate"]
    },
    {
      "name": "Dr.Emma Collins",
      "specialty": "Menopause Specialist",
      "location": "London, UK",
      "experience": "8 years experience",
      "rating": "4.5",
      "available": ["Online"]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Widgets.heightSpaceH1,
              Texts.textBold('Find a Speacialist',textAlign: TextAlign.start,size: 22),
              Widgets.heightSpaceH05,

              Texts.textNormal('Find a Speacialist',textAlign: TextAlign.start,size: 16),
              Widgets.heightSpaceH1,
              EntrySearchField(
                prefixIcon: Assets.searchbarIcon,color: ColorConstants.blackColor,
                hint: "Search By Name,Specialty,Location",
              ),
              Widgets.heightSpaceH1,
              Expanded(
                child: ListView.builder(
                  itemCount: specialists.length,
                  itemBuilder: (context, index) {
                    final doc = specialists[index];
                    return DoctorCard(doc: doc,icon: Assets.corporateIcon,);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
