import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbancare_delivery_boy/static/show_toast/showTost_msg.dart';

class backTocloseApp {
  static DateTime? _lastBackPressed;
  BuildContext context;
  backTocloseApp(this.context);
  Future<bool> myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo info) async {
    DateTime now = DateTime.now();
    // ShowToast(msg: "Back");
    // return true;

    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > Duration(seconds: 2)) {
      _lastBackPressed = now;
      // var routeName = info.currentRoute(context)?.settings.name;
      // // var currentNav = Provider.of<BottomUpdate>(context, listen: false);
      // // ShowToast(msg: "${routeName.toString()}");
      // if (routeName.toString() == "nav") {
      //   if (currentNav.selectedIndex == 2) {
      //     ShowToast(msg: "Press back again to exit");
      //   } else {
      //     currentNav.changeBottomTab(2);
      //   }

      //   return true;
      // } else {
      //   Navigator.of(context).pop();
      //   // Navigator.pop(context);
      //   // Navigator.pushReplacement(
      //   //     context,
      //   //     MaterialPageRoute(
      //   //         builder: (context) => BottomNavigationScreen(),
      //   //         settings: RouteSettings(name: 'nav')));
      //   return true;
      // }
      // // ShowToast(msg: routeName.toString());
      // //   // ShowToast(msg: "Press back again to exit");
      // //   Navigator.pop(context);
      // // return true;

      // //
      // // if (_lastBackPressed == null ||
      // //     now.difference(now) > Duration(seconds: 2)) {
      // //   _lastBackPressed = now;
      // //   // ShowToast(msg: lskjjg.toString());
      // //   ShowToast(msg: "Press back again to exit");
      // //   return Future.value(false);
      // // }
      // // Do not exit the app
      ShowToast(msg: "Press Again To back");
    return true;
    } else {
      SystemNavigator.pop();

      return false;
    }

    // Exit the app
  }
}
