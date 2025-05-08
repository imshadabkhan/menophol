import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/view/bottom_nav_bar/modules/chat/chat_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/consult/consult_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/home.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/track_symptoms.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TrackSymptoms(),
    ChatView(),

    Placeholder(), // Profile screen placeholder
    ConsultView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Assets.navbarIcon1, height: 20,color: _currentIndex == 0?ColorConstants.darkPrimaryColor:Colors.grey ,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.navbarIcon2, height: 20,color: _currentIndex == 1?ColorConstants.darkPrimaryColor:Colors.grey ,),
            label: 'track',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.navbarIcon3, height: 20,color: _currentIndex == 2?ColorConstants.darkPrimaryColor:Colors.grey ,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.navbarIcon4, height: 20,color: _currentIndex == 3?ColorConstants.darkPrimaryColor:Colors.grey ,),
            label: 'Validate',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.navbarIcon5, height: 20,color: _currentIndex == 4?ColorConstants.darkPrimaryColor:Colors.grey ,),
            label: 'Consult',
          ),
        ],
      ),
    );
  }
}
