import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/exercise.dart';

import 'package:get/get.dart';
import 'package:menophol/view/glp_medication/controller/controller.dart';





class GlpMedicationDatabase extends StatelessWidget {
  GlpMedicationDatabase({super.key});

  final List<String> btnLabels = [
    'Formatted Text',
    "CSV format",
    "JSON format"
  ];

  final GlpMedicationController controller = Get.put(GlpMedicationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Widgets.heightSpaceH05,
            Texts.textBold('GLP-1 Medication Data', size: 20),
            Widgets.heightSpaceH1,
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: btnLabels.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                    onTap: () => controller.changeTab(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, ),
                      decoration: BoxDecoration(
                        color: controller.selectedIndex.value == index
                            ? ColorConstants.darkPrimaryColor
                            : ColorConstants.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: controller.selectedIndex.value == index?ColorConstants.transparentColor:ColorConstants.blackColor)
                      ),
                      child: Center(
                        child: Text(
                          btnLabels[index],
                          style: TextStyle(
                            color: controller.selectedIndex.value == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
            Widgets.heightSpaceH1,
            Expanded(
              child: Obx(() {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ListView(
                    children: [
                      getTabView(controller.selectedIndex.value),
                    ],
                  ),
                );
              }),
            ),
            Widgets.heightSpaceH2,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    radius: 4,
                    label: "Copy to clipboard",
                    borderColor: ColorConstants.blackColor,
                    textColor: ColorConstants.blackColor,
                  ),
                ),
                Widgets.widthSpaceW3,
                Expanded(
                  child: CustomButton(
                    radius: 4,
                    label: "Download as text",
                    backgroundColor: ColorConstants.darkPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget getTabView(int index) {
    switch (index) {
      case 0:
        return Texts.textNormal("## Estrogen Medications  ### Ovestin Cream  Dosage: Initial: 1 applicatorful (0.5 mg estriol) daily Alternative Dosage 1: Maintenance: 1 applicatorful twice weekly Frequency: As prescribed Type: Cream PIL Link: https://www.medicines.org.uk/emc/product/6674/pil Detailed Info: Initial dose: Apply 1 applicatorful (0.5 mg estriol) daily for the first 2 to 3 weeks. Maintenance dose: After initial treatment, reduce to 1 applicatorful twice a week.   ### Oestrogel Pump-Pack  Dosage: 2 pumps (1.5 mg estradiol) daily Alternative Dosage 1: 3 pumps (2.25 mg estradiol) daily Alternative Dosage 2: 4 pumps (3.0 mg estradiol) daily Frequency: Daily Type: Gel PIL Link: https://www.medicines.org.uk/emc/product/353/pil Detailed Info: Starting dose: Apply 2 pumps (2.5 g gel containing 1.5 mg estradiol) once daily. If symptoms persist after one month, the dose may be increased to a maximum of 4 pumps (5 g gel containing 3.0 mg estradiol) daily.   ### Sandrena Gel  Dosage: 0.5 mg daily Alternative Dosage 1: 1 mg (1 sachet) daily Alternative Dosage 2: 1.5 mg daily Frequency: Daily Type: Gel PIL Link: https://www.medicines.org.uk/emc/product/1048/pil Detailed Info: Starting dose: Apply 1 mg (1 sachet) once daily. Depending on clinical response, the dose may be adjusted between 0.5 mg to 1.5 mg daily.   ### Estradot  Dosage: 25 micrograms/24 hours Alternative Dosage 1: 37.5 micrograms/24 hours Alternative Dosage 2: 50 micrograms/24 hours Alternative Dosage 3: 75 micrograms/24 hours Alternative Dosage 4: 100 micrograms/24 hours Frequency: Replace twice weekly Type: Patch PIL Link: https://www.medicines.org.uk/emc/product/7225/pil Detailed Info: Apply one patch delivering 25 to 100 micrograms of estradiol per day, replacing it twice weekly.   ### Evorel  Dosage: 25 micrograms/24 hours Alternative Dosage 1: 50 micrograms/24 hours Alternative Dosage 2: 75 micrograms/24 hours Alternative Dosage 3: 100 micrograms/24 hours Frequency: Replace twice weekly Type: Patch PIL Link: https://www.medicines.org.uk/emc/product/846/pil Detailed Info: Apply one patch delivering 25 to 100 micrograms of estradiol per day, replacing it twice weekly.",maxLines: 100,textAlign: TextAlign.start,size: 14);
      case 1:
        return Texts.textNormal("Category,Medication,Dosage,Frequency,Type,PIL Link,Detailed Info  Estrogen Medications,Ovestin Cream,Initial: 1 applicatorful (0.5 mg estriol) daily,As prescribed,Cream,https://www.medicines.org.uk/emc/product/6674/pil,Initial dose: Apply 1 applicatorful (0.5 mg estriol) daily for the first 2 to 3 weeks.Maintenance dose: After initial treatment, reduce to 1 applicatorful twice a week. Estrogen Medications,Oestrogel Pump-Pack,2 pumps (1.5 mg estradiol) daily,Daily,Gel,https://www.medicines.org.uk/emc/product/353/pil,Starting dose: Apply 2 pumps (2.5 g gel containing 1.5 mg estradiol) once daily. If symptoms persist after one month, the dose may be increased to a maximum of 4 pumps (5 g gel containing 3.0 mg estradiol) daily. Estrogen Medications,Sandrena Gel,0.5 mg daily,Daily,Gel,https://www.medicines.org.uk/emc/product/1048/pil,Starting dose: Apply 1 mg (1 sachet) once daily. Depending on clinical response, the dose may be adjusted between 0.5 mg to 1.5 mg daily. Estrogen Medications,Estradot,25 micrograms/24 hours,Replace twice weekly,Patch,https://www.medicines.org.uk/emc/product/7225/pil,Apply one patch delivering 25 to 100 micrograms of estradiol per day, replacing it twice weekly. Estrogen Medications,Evorel,25 micrograms/24 hours,Replace twice weekly,Patch,https://www.medicines.org.uk/emc/product/846/pil,Apply one patch delivering 25 to 100 micrograms of estradiol per day, replacing it twice weekly. Estrogen Medications,FemSeven,50 micrograms/24 hours,Replace once weekly,Patch,https://www.medicines.org.uk/emc/product/1325/pil,Apply one patch delivering 50 to 100 micrograms of estradiol per day, replacing it once weekly. Estrogen Medications,Estraderm MX,25 micrograms/24 hours,Replace twice weekly,Patch,https://www.medicines.org.uk/emc/product/5839/pil,Apply one patch delivering 25 to 100 micrograms of estradiol per day, replacing it twice weekly. Estrogen Medications,Lenzetto,1 spray (1.53 mg estradiol) daily,Daily,Spray,https://www.medicines.org.uk/emc/product/11175/pil,Starting dose: Apply 1 spray (1.53 mg estradiol) once daily. Depending on clinical response, the dose may be increased to 2 or 3 sprays daily. Estrogen Medications,Progynova,1 mg daily,Daily,Tablet,https://www.medicines.org.uk/emc/product/1417/pil,Take 1 mg or 2 mg estradiol once daily. Estrogen Medications,Elleste Solo,1 mg daily,Daily,Tablet,https://www.medicines.org.uk/emc/product/9512/pil,Take 1 mg or 2 mg estradiol once daily. Estrogen Medications,Zumenon,1 mg daily,Daily,Tablet,https://www.medicines.org.uk/emc/product/1173/pil,Take 1 mg or 2 mg estradiol once daily. Estrogen Medications,Premarin,0.3 mg daily,Daily,Tablet,https://www.medicines.org.uk/emc/product/2900/pil,For menopausal symptoms, take 0.3 mg to 1.25 mg conjugated estrogens once daily.",maxLines: 100,size: 14,textAlign: TextAlign.start);
      case 2:
        return Texts.textNormal("[   {     category: Estrogen Medications,     medication: Ovestin Cream,     dosages: [       Initial: 1 applicatorful (0.5 mg estriol) daily,       Maintenance: 1 applicatorful twice weekly     ],    frequency: As prescribed,     type: Cream,     description: Topical treatment for vaginal dryness and other estrogen deficiency symptoms.,     detailedInfo: Initial dose: Apply 1 applicatorful (0.5 mg estriol) daily for the first 2 to 3 weeks. Maintenance dose: After initial treatment, reduce to 1 applicatorful twice a week.,     pilLink: https://www.medicines.org.uk/emc/product/6674/pil   },   {     category: Estrogen Medications,     medication: Oestrogel Pump-Pack,     dosages: [       2 pumps (1.5 mg estradiol) daily,       3 pumps (2.25 mg estradiol) daily,       4 pumps (3.0 mg estradiol) daily    ],",textAlign: TextAlign.start,size: 14,maxLines: 100);
      default:
        return Texts.textNormal("No Data");
    }
  }
}

