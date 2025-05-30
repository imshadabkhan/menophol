
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:menophol/core/routes/app_routes.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/editprofile/edit_profile.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/notification_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,horizontalTitleGap: 5,
      leading: GestureDetector(
        onTap: (){
          Get.toNamed(AppRoutes.editProfile);
        },
        child: CircleAvatar(

          radius: 20.r,
          backgroundImage: AssetImage('assets/images/profile_circular_image.png'),
        ),
      ),
      title: Texts.textNormal('Welcome Back',
          textAlign: TextAlign.start, size: 11),
      subtitle: Texts.textBold("Freddy", textAlign: TextAlign.start, size: 16),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: (){

                    Get.toNamed(AppRoutes.notificationView);
                  },
                  child: Image.asset(
                    "assets/icons/notification.png",
                    height: 23,
                  ),
                ),
                Positioned(
                    top: 1,
                    right: 3,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ))
              ],
            ),
            Widgets.widthSpaceW1,
            Image.asset(
              "assets/icons/setting_icon.png",
              height: 23,
            ),
          ],
        ),
      ),
    );
  }
}