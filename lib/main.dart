import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/viewmodel/address_viewmodel.dart';
import 'package:urbancare_delivery_boy/viewmodel/auth_viewmodel.dart';
import 'package:urbancare_delivery_boy/viewmodel/home_viewmodel.dart';
import 'package:urbancare_delivery_boy/viewmodel/profile_viewmodel.dart';

import 'static/app_theme.dart';
import 'static/navigation_route/app_pages.dart';

void main() {
  Get.lazyPut<AuthViewmodel>(() => AuthViewmodel(), fenix: true);
    Get.lazyPut<addressViewmodel>(() => addressViewmodel(), fenix: true);
    Get.lazyPut<homeViewmodel>(() => homeViewmodel(), fenix: true);
    Get.lazyPut<profileViewmodel>(() => profileViewmodel(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      title: 'Urbancare Deliveryboy',
      theme: CustomTheme.themedata,
      // home: const SplashScreen(),
      defaultTransition: Transition.fadeIn,
    );
  }
}