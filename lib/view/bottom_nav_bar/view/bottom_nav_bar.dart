import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/view/bottom_nav_bar/modules/chat/chat_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/consult/consult_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/home.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/track_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/validate/validate_view.dart';

class BottomNavBar extends StatelessWidget {
BottomNavBar({super.key});
  List screens=[
    HomeScreen(),
    TrackView(),
    ChatView(),
    ValidateView(),
    ConsultView(),

  ];

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
                items: [
          BottomNavigationBarItem(icon: Image.asset(Assets.navbarIcon1,height: 20,), label: 'Home',),
          BottomNavigationBarItem(icon: Image.asset(Assets.navbarIcon2,height: 20,), label: 'Chat'),
          BottomNavigationBarItem(icon: Image.asset(Assets.navbarIcon3,height: 20,), label: 'Validate'),
          BottomNavigationBarItem(icon: Image.asset(Assets.navbarIcon4,height: 20,), label: 'Profile'),
          BottomNavigationBarItem(icon: Image.asset(Assets.navbarIcon5,height: 20,), label: 'Consult'),

        ],
      ),
      body:  screens[0],
    );
  }
}
