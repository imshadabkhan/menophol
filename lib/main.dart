import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:menophol/core/routes/app_routes.dart';


import 'view/bottom_nav_bar/view/bottom_nav_bar.dart';






void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          getPages: AppRoutes.routes,

          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),

          home: child,
        );
      },
         // child: GlpMedications(),
      // child: HrtMedication(),
          child: BottomNavBar(),
      // child:ConnectWearableDevicesScreen(),
       // child: MedicalConditionView(),
      // child: ChangePassword(),
      // child: SplashView(),
      //  child: MedicalProcedureScreen(),
    );
  }
}
