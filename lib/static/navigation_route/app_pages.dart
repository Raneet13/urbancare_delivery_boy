import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/screen/more/more_screen.dart';
import 'package:urbancare_delivery_boy/screen/notification/notification_screen.dart';
import 'package:urbancare_delivery_boy/screen/wallet/wallet_screen.dart';

import '../../screen/auth/change_password.dart';
import '../../screen/auth/login_screen.dart';
import '../../screen/auth/phone_check.dart';
import '../../screen/auth/signup_screen.dart';
import '../../screen/home/home_screen.dart';
import '../../screen/home/product_details_screen.dart';
import '../../screen/navigation/bottom_navigationr.dart';
import '../../screen/splash/splash_screen.dart';
import 'app_route.dart';

class AppPages {
  // AppPages._();
  AppPages();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
     GetPage(
      name: Paths.WELCOME,
      page: () => SplashScreen(),
      // binding: WelcomeBinding(),
    ),
    GetPage(
      name: Paths.login,
      page: () => LoginScreen(),
      // binding: WelcomeBinding(),
    ),
    GetPage(
      name: Paths.Signup,
      page: () => SignupScreen(),
      // binding: WelcomeBinding(),
    ),
    GetPage(
      name: Paths.change_password,
      page: () => UpdatePassword(),
      // binding: StandardNavigationMainBinding(),
    ),
    GetPage(
      name: Paths.check_email,
      page: () => ForgetPassword(),
      // binding: StandardNavigationDetailBinding(),
    ),
    GetPage(
      name: Paths.nav,
      page: ()=>BottomNavigationScreen(),
      // page: () => BottomNavigationScreen(screen:Get.arguments ??const HomeScreen()),
      // binding: NestedNavigationDetailBinding(),
      children: [
 GetPage(
      name: Paths.HOME,
      page: () => HomeScreen(),
      // binding: HomeBinding(),
       children: [
        // GetPage(
        //   name: Paths.OrderDetailS,
        //   page: () => OrderDetailScreen(),
        // ),
        // GetPage(
        //   name: '/favorites',
        //   page: () => Favorites(),
        // ),
        // GetPage(
        //   name: '/orders',
        //   page: () => Orders(),
        // ),
    ],
    ),
       GetPage(
      name: Paths.wallet,
      page: () => WalletScreen(),
      // binding: NestedNavigationMainBinding(),
    ),
    GetPage(
      name: Paths.notification,
      page: () => NotificationScreen(),
      // binding: SubTabsNestedNavigationMainBinding(),
    ),
    GetPage(
      name: Paths.more,
      page: () => MoreScreen(),
      // binding: SubTabsNestedNavigationComputersMainPageBinding(),
    ),
      ]
    ),
   
    // GetPage(
    //   name: Paths.SUB_TABS_NESTED_NAVIGATION_COMPUTER_DETAIL_PAGE,
    //   page: () => SubTabsNestedNavigationComputerDetailPageView(argument: ''),
    //   binding: SubTabsNestedNavigationComputerDetailPageBinding(),
    // ),
    // GetPage(
    //   name: Paths.SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE,
    //   page: () => SubTabsNestedNavigationLaptopDetailPageView(argument: ''),
    //   binding: SubTabsNestedNavigationLaptopDetailPageBinding(),
    // ),
    // GetPage(
    //   name: Paths.SUB_TABS_NESTED_NAVIGATION_LAPTOPS_MAIN_PAGE,
    //   page: () => SubTabsNestedNavigationLaptopsMainPageView(),
    //   binding: SubTabsNestedNavigationLaptopsMainPageBinding(),
    // ),
  ];
  
  // String get route {
  //   return '/${Paths(this)}';
  // }

   Widget getScreenForRoute(String? route) {
        print(route);
    switch (route) {
      case "${Paths.nav}/${Paths.HOME}":
        return const HomeScreen();
        case "${Paths.nav}/${Paths.wallet}":
        return const WalletScreen();
      case "${Paths.nav}/${Paths.notification}":
        return const NotificationScreen();
      case Paths.more:
        return const MoreScreen();
      default:
        return const HomeScreen();
    }
  }
 Widget getRouteForIndex(int index) {
   
   switch (index) {
          case 0:
            return HomeScreen();
          case 1:
            return WalletScreen();
          case 2:
            return NotificationScreen();
          case 3:
            return MoreScreen();
          default:
            return HomeScreen(); // Default screen
        }
  }

  // static GetPageRoute getPage(RouteSettings settings) {
  //   var destination = Path.firstWhereOrNull((e) => e.route == settings.name);
  //   return GetPageRoute(page: () => destination?.widget ?? Container());
  // }
}
