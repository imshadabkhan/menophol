import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/custom_expansion_tile.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/expandable_list_tile.dart';
import 'package:menophol/core/widgets/radiobuttonwithtext.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';

class Supplements extends StatelessWidget {
   Supplements({super.key});

  final List<TrackItem> trackItems = [
  TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Vitamin D',
        subtitle: 'Important for bone health and immune function',
    subtitle2: "Recommended: 100-200 IU daily",
    ),
    TrackItem(
        icon: Assets.supplimentsIcon,
        title: 'Vitamin D',
        subtitle: 'Important for bone health and immune function',
      subtitle2: "Recommended: 100-200 IU daily",
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:PaddingConstants.screenPaddingHalf,
          child: Column(children: [

            EntryField(prefixIcon: Assets.calendarIcon,hint: "07/04/2025",),
            Widgets.heightSpaceH05,
            EntrySearchField(prefixIcon: Assets.searchbarIcon,hint: "Search Symptoms",),
            Widgets.heightSpaceH1,
            CustomExpansionTile(
              title: 'Vitamins',
        
              children: [
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    itemCount: trackItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 2),
                    itemBuilder: (context, index) {
        
                      return ExpandableListTile(item: trackItems[index],children: [
        
        
        
        Widgets.heightSpaceH1,
                        EntryField(
                          label: "Dosage",
                          hint:"Enter custom trigger",
                          borderRadius: BorderRadius.circular(12),),
        
                        Widgets.heightSpaceH1,
                        CustomButton(
                          backgroundColor: ColorConstants.darkPrimaryColor,
                          label: 'Save supplement',
        
                        ),
        
        
        
                      ],);
                    },
                  ),
                ),
              ],
            ),
            CustomExpansionTile(
              title: 'Minerals',
        
              children: [
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    itemCount: trackItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 2),
                    itemBuilder: (context, index) {

                      return ExpandableListTile(item: trackItems[index],children: [



                        Widgets.heightSpaceH1,
                        EntryField(
                          label: "Dosage",
                          hint:"Enter custom trigger",
                          borderRadius: BorderRadius.circular(12),),

                        Widgets.heightSpaceH1,
                        CustomButton(
                          backgroundColor: ColorConstants.darkPrimaryColor,
                          label: 'Save supplement',

                        ),



                      ],);
                    },
                  ),
                ),
              ],
            ),
            CustomExpansionTile(
              title: 'Herbs',
        
              children: [
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    itemCount: trackItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 2),
                    itemBuilder: (context, index) {
        
                      return ExpandableListTile(item: trackItems[index],children: [
        
        
        
                        Widgets.heightSpaceH1,
                        EntryField(
                          label: "Dosage",
                          hint:"Enter custom trigger",
                          borderRadius: BorderRadius.circular(12),),
        
                        Widgets.heightSpaceH1,
                        CustomButton(
                          backgroundColor: ColorConstants.darkPrimaryColor,
                          label: 'Save supplement',
        
                        ),
        
        
        
                      ],);
                    },
                  ),
                ),
              ],
            ),
            CustomExpansionTile(
              title: 'Custom Supplements',
        
              children: [
                SizedBox(
                  height: 300.h,
                  child: ListView.separated(
                    itemCount: 1,
                    separatorBuilder: (_, __) => const SizedBox(height: 2),
                    itemBuilder: (context, index) {
                          
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: ColorConstants.greyBgColor)
                         ),
                          child: Padding(
                            padding: PaddingConstants.screenPaddingHalf,
                            child: Column(
                              children: [

                                EntryField(

                                  hint:"Enter supplement name",
                                  borderRadius: BorderRadius.circular(12),),
                                Widgets.heightSpaceH1,
                                EntryField(

                                  hint:"Describe the supplement",
                                  borderRadius: BorderRadius.circular(12),),
                                Widgets.heightSpaceH1,
                                EntryField(
                                  label: "Dosage",
                                  hint:"Enter custom trigger",
                                  borderRadius: BorderRadius.circular(12),),

                                Widgets.heightSpaceH1,
                                CustomButton(
                                  backgroundColor: ColorConstants.darkPrimaryColor,
                                  label: 'Add custom supplement',

                                ),

                              ],
                            ),
                          ),

                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        
          ],),
        ),
      ),
    );
  }
}
