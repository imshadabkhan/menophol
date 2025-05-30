import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/widgets/home_screen_card.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/controller.dart';

class FeelingListWidget extends StatelessWidget {
  const FeelingListWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Obx(
                () => HomeScreenCards(
              icon: controller.icons[index],
              text: controller.titleList[index],
            ),
          ),
        ),
      ),
    );
  }
}