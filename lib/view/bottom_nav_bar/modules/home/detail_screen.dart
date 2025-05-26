import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:menophol/core/constants/assets_constants.dart';

import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/rich_txt_paragraphs.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: PaddingConstants.screenPaddingHalf.copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        Assets.detailScreenImage,
                        fit: BoxFit.cover,
                      )),
                ),
                Widgets.heightSpaceH2,
                Texts.textBold("What is Menopause? A Simple Guide",
                    textAlign: TextAlign.start, size: 18),
                Widgets.heightSpaceH05,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 15,
                        ),
                        Widgets.widthSpaceW05,
                        Texts.textNormal("5 Min Read", size: 14),
                      ],
                    ),
                    Texts.textNormal("NHS UK", size: 14),
                  ],
                ),
                Widgets.heightSpaceH2,
                Texts.textBold("What is Menopause?", size: 18),
                Widgets.heightSpaceH05,
                Texts.textNormal(
                    "Menopause is a natural biological process that marks the end of a woman's reproductive years. It is officially diagnosed after 12 consecutive months without a menstrual period and typically occurs between ages 45 and 55, with the average age in the UK being 51.",
                    textAlign: TextAlign.start,
                    size: 14,
                    maxLines: 10),
                Widgets.heightSpaceH2,
                Texts.textBold("The Three Stages", size: 18),
                Widgets.heightSpaceH05,
                RichTextParagraphs(
                  title: "Perimenopause:",
                  subTitle:
                      "The transitional time before menopause when hormone levels fluctuate, causing changes in menstrual patterns and the beginning of some symptoms. This phase can last 2-10 years.",
                ),
                RichTextParagraphs(
                  title: "Menopause:",
                  subTitle:
                      "The point when you have not had a period for 12 consecutive months.",
                ),
                RichTextParagraphs(
                  title: "Postmenopause:",
                  subTitle:
                      "The years following menopause when many symptoms may ease, but risks for certain health conditions increase due to lower oestrogen levels.",
                ),
                Widgets.heightSpaceH1,
                Texts.textBold("Common Symptoms",size: 18),
                Widgets.heightSpaceH05,
                Texts.textNormal(
                    "Menopausal symptoms result from the body's decreasing production of oestrogen and progesterone. Symptoms can vary significantly between women in both severity and duration, with some experiencing minimal disruption while others find their daily life significantly impacted.",
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    size: 14),
                Widgets.heightSpaceH1,
                Texts.textNormal('Common symptoms include',size: 16),
                Widgets.heightSpaceH05,
                RichTextParagraphs(
                  title: "",
                  subTitle: "Hot flushes and night sweats",
                ),
                RichTextParagraphs(
                  title: "",
                  subTitle: "Sleep disturbances",
                ),
                RichTextParagraphs(
                    title: "",
                    subTitle: "Mood changes(irritability,low mood,anxiety"),
                RichTextParagraphs(
                    title: "", subTitle: "Reduce sex drive(libido)"),
                RichTextParagraphs(
                    title: "",
                    subTitle: "Problems with memory and concentration"),
                RichTextParagraphs(
                    title: "", subTitle: "Vaginal dryness and discomfort"),
                RichTextParagraphs(
                    title: "", subTitle: "Recurrent urinary tract infections"),
                Widgets.heightSpaceH1,
                Texts.textBold("When to See Your GP", size: 18),
                Widgets.heightSpaceH05,
                Texts.textNormal(
                    'The NHS recommends seeing your GP if menopausal symptoms are interfering with your daily life. A diagnosis is typically made based on your symptoms, age, and menstrual history. Blood tests to check hormone levels may sometimes be used, particularly for women under 45.',
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    size: 14),
              ],
            ),
          ),
        ));
  }
}


