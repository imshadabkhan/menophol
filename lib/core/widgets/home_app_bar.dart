
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20.r,
        backgroundImage: AssetImage('assets/images/profile_circular_image.png'),
      ),
      title: Texts.textNormal('Welcome Back',
          textAlign: TextAlign.start, size: 16),
      subtitle: Texts.textBold("Freddy", textAlign: TextAlign.start, size: 22),
      trailing: SizedBox(
        width: 50.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  "assets/icons/notification.png",
                  height: 20,
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
            Widgets.widthSpaceW05,
            Image.asset(
              "assets/icons/setting_icon.png",
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}