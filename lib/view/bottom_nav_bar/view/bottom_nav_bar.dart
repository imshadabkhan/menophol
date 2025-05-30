import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';

import 'package:menophol/view/bottom_nav_bar/modules/chat/chat_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/consult/consult_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/home.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/track_symptoms.dart';
import 'package:menophol/view/bottom_nav_bar/modules/validate/validate_view.dart';
import 'package:menophol/view/bottom_nav_bar/view/controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> _screens = [
    HomeScreen(),
    TrackSymptoms(),
    ChatView(),
    ValidateHomePage(),
    ConsultView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: _screens[controller.currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: controller.changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.navbarIcon1,
              height: 20,
              color: controller.currentIndex.value == 0
                  ? ColorConstants.darkPrimaryColor
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.navbarIcon2,
              height: 20,
              color: controller.currentIndex.value == 1
                  ? ColorConstants.darkPrimaryColor
                  : Colors.grey,
            ),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.navbarIcon3,
              height: 20,
              color: controller.currentIndex.value == 2
                  ? ColorConstants.darkPrimaryColor
                  : Colors.grey,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.navbarIcon4,
              height: 20,
              color: controller.currentIndex.value == 3
                  ? ColorConstants.darkPrimaryColor
                  : Colors.grey,
            ),
            label: 'Validate',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.navbarIcon5,
              height: 20,
              color: controller.currentIndex.value == 4
                  ? ColorConstants.darkPrimaryColor
                  : Colors.grey,
            ),
            label: 'Consult',
          ),
        ],
      ),
    ));
  }
}
