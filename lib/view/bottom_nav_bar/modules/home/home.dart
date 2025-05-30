import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/routes/app_routes.dart';
import 'package:menophol/core/widgets/conversation_block.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/feeling_list_widget.dart';
import 'package:menophol/core/widgets/home_app_bar.dart';
import 'package:menophol/core/widgets/list_tile_widget.dart';
import 'package:menophol/core/widgets/report_card.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: HomeAppBar(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReportCard(),
            Widgets.heightSpaceH2,
            Texts.textBold('How are you feeling today?',
                textAlign: TextAlign.start, size: 20),
            Widgets.heightSpaceH05,
            Texts.textNormal(
                "Track your symptoms. Take back control of your  health.",
                size: 14,
                textAlign: TextAlign.start),
            Widgets.heightSpaceH1,
            FeelingListWidget(controller: controller),
            Widgets.heightSpaceH2,
            ConversationBlock(),
            Widgets.heightSpaceH2,
            Widgets.heightSpaceH05,
            Texts.textBold('What You Need to Know', size: 20),
            Widgets.heightSpaceH05,
            Texts.textNormal('Insights on your body, mind, and hormones.',
                size: 14,textAlign: TextAlign.start),
            Widgets.heightSpaceH2,
            Column(
              children: List.generate(3, (index) {


                return GestureDetector(
                    onTap: ()=>Get.toNamed(AppRoutes.detailView),
                    child: ListTile_Widget());
              }),
            ),
            Widgets.heightSpaceH1,
            CustomButton(
              onTap: (){
                Get.toNamed(AppRoutes.detailView);
              },
              label: "View all",
              backgroundColor: ColorConstants.darkPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}






