import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../static/navigation_route/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
 void afterBuildFunction(BuildContext context) {
  Future.delayed(Duration(seconds: 5), () async{
      final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
       if (userId!=null) {
          Get.offAllNamed(Paths.nav);
       } else {
       Get.offAllNamed(Paths.login);   
       }
   
    //  Get.toNamed(Paths.nav);
    // Navigator.pushNamed(context, '/navigation');
  });
}

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterBuildFunction(context);
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("asset/urban_logo.png",fit: BoxFit.fill,),
        ),
      ),
    );
  }
}