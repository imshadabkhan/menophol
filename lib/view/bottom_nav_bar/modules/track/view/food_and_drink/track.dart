import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/entry_field.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class Track extends StatelessWidget {
  const Track({super.key});
 final List<String> foodList= const [
  "Breakfast",'Main meals','Spicy food'
];
  final List<String> mealList= const [
    'Cereal','Eggs','Toast/Breads','Pancakes','Smoothies','Pastries','Yogurt'
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Padding(
       padding: PaddingConstants.screenPaddingHalf.copyWith(bottom: 5),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

               EntryField(
                 prefixIcon: Assets.calendarIcon,
                 hint: "07/04/2025",
               ),
               Widgets.heightSpaceH05,
               Row(children: [
                 CustomButton(
                   backgroundColor: ColorConstants.darkPrimaryColor,
                   borderColor: ColorConstants.blackColor,
                   width: 90.w,
                   fontSize: 12,
                   label: "Food",





                 ),Widgets.widthSpaceW1,
                 CustomButton(

                   backgroundColor: ColorConstants.darkPrimaryColor,
                   width: 90.w,

             fontSize: 12,
                   label: "Drink",
                 )

               ],),
               Widgets.heightSpaceH2,
               Texts.textBold("Meal Type",textAlign: TextAlign.start,size: 18.sp),
                 Widgets.heightSpaceH05,
               Row(
                 spacing: 16,
                 children: [
                 Texts.textNormal('Breakfast',size: 14), Texts.textNormal('Lunch',size: 14), Texts.textNormal('Dinner',size: 14), Texts.textNormal('Snack',size: 14),



               ],),
                 Widgets.heightSpaceH1,
               EntrySearchField(
                 prefixIcon: Assets.searchbarIcon,
                 hint: "Search for food or drink",

               ),

                 SizedBox(
                   height: 50.h,
                   child: ListView.builder(
                     itemCount: foodList.length,
             scrollDirection: Axis.horizontal,
                       itemBuilder:(BuildContext context,int index){

                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: CustomButton(
                             onTap: (){},
                             label: foodList[index],backgroundColor: ColorConstants.darkPrimaryColor,width: 90.w,height: 30.h,),
                         );



                   }),
                 ),
                 Widgets.heightSpaceH05,
                 Widgets.divider(),
                 Widgets.heightSpaceH2,
                Flexible(

                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount:mealList.length,
                      itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MealBoxWidget(title:mealList[index]),
                    );
                  }),
                ),
                 Widgets.heightSpaceH05,




             ],),
           ),
           Widgets.divider(),
           Widgets.heightSpaceH1,
           Texts.textMedium('Add Custom Food',size: 16,),
           Widgets.heightSpaceH05,

           Row(children: [
             Expanded(child: EntryField(hint: "Enter custom food",)),
             Widgets.widthSpaceW3,
             CustomButton(label: "Add",width: 60.w,height: 40.h,backgroundColor: ColorConstants.blackColor,),

           ],),
         ],
       ),
     ),
    );
  }
}

class MealBoxWidget extends StatelessWidget {
  const MealBoxWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorConstants.blackColor,
          width: 1,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Image.asset(Assets.forkKnifeIcon,width: 20,height: 20,),
          Widgets.widthSpaceW2,
          Texts.textMedium(title,size: 15),
          Expanded(child: Widgets.widthSpaceW1),
          Icon(Icons.add,color: Colors.black,),



        ],),
      ),
    );
  }
}
