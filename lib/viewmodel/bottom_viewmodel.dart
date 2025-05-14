import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/home/home_screen.dart';

class BottomNavController extends GetxController {
 Rx<Widget> screen = Rx<Widget>(HomeScreen());
  Rx<Widget> prevScreen = Rx<Widget>(HomeScreen());
  // Selected index observable
  RxInt selectedIndex = 0.obs;

  // Function to update index for update bootom index and as wel as  widget of the shown on the screen
  void updateIndex(int index,Widget sc) {
    prevScreen.value =screen.value;
    selectedIndex.value = index;
   screen.value = sc;
  }
  // showPage(){
  //   // Navigator(
  //   //     key: Get.nestedKey(1), // Key for the nested navigator
  //       // initialRoute: Paths.HOME, // Initial route inside the navigator
  //     (settings) {
  //          var screen = AppPages().getScreenForRoute(settings.name);
  //         // bool showBottomNav = _shouldShowBottomNav(settings.name);
  //         return GetPageRoute(
  //           // page: () =>AppPages().getScreenForRoute(settings.name),//. getScreenForRoute(settings.name),
  //          page:()=> screen,
  //           routeName: settings.name,
  //         );
  //       };
  //     // );
  // }
  // Widget get currentScreen => screens[selectedIndex.value];
}
