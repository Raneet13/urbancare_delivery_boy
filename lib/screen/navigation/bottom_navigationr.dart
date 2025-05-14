import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/screen/more/more_screen.dart';
import 'package:urbancare_delivery_boy/screen/notification/notification_screen.dart';
import 'package:urbancare_delivery_boy/screen/wallet/wallet_screen.dart';
import 'package:urbancare_delivery_boy/static/app_color.dart';
import 'package:urbancare_delivery_boy/static/navigation_route/app_pages.dart';

import '../../static/navigation_route/app_route.dart';
import '../../viewmodel/bottom_viewmodel.dart';
import '../home/home_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  // Initialize the controller
//  Widget screen;
//    BottomNavigationScreen({super.key, required this.screen});
  final BottomNavController controller = Get.put(BottomNavController());

  // List<Widget> pagee =[
  //   HomeScreen(),
  //   WalletScreen(),
  //   NotificationScreen(),
  //   MoreScreen()
  // ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("GetX Bottom Navigation")),
      body: Obx(()=>controller.screen.value),
//             body: Obx(() {
//  return AppPages().getRouteForIndex(controller.selectedIndex.value);
//       }),
  // body: Navigator(
  //       key: Get.nestedKey(1), // Key for the nested navigator
  //       // initialRoute: Paths.HOME, // Initial route inside the navigator
  //       onGenerateRoute: (settings) {
  //          var screen = AppPages().getScreenForRoute(settings.name);
  //         // bool showBottomNav = _shouldShowBottomNav(settings.name);
  //         return GetPageRoute(
  //           // page: () =>AppPages().getScreenForRoute(settings.name),//. getScreenForRoute(settings.name),
  //          page:()=> screen,
  //           routeName: settings.name,
  //         );
  //       },
  //     ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          selectedFontSize: 16,
          selectedLabelStyle: TextStyle(fontSize: 16),
          unselectedFontSize: 15,

          selectedItemColor: Colo.primaryColor,
          selectedIconTheme: IconThemeData(size: 30),
          onTap:(index){

            switch(index){
              case 0:
              controller.updateIndex(index,HomeScreen());
              // case 1:
              // controller.updateIndex(index,WalletScreen());
              case 1:
              controller.updateIndex(index,NotificationScreen());
              case 2:
              controller.updateIndex(index,MoreScreen());
              default:
              controller.updateIndex(index,HomeScreen());
            }
            // controller.updateIndex(index,HomeScreen());
            // Get.toNamed(AppPages().getRouteForIndex(index)); 
            
          } ,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.wallet),
            //   label: "Wallet",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }
}
