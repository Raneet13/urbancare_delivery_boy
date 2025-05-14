
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../static/app_color.dart';
import '../../static/custom_elevated_button.dart';
import '../../static/custom_textfield.dart';
import '../../static/navigation_route/app_route.dart';
import '../../viewmodel/auth_viewmodel.dart';
import '../home/home_screen.dart';

class LoginScreen extends GetView<AuthViewmodel> {
LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
  final _formeyLogin = GlobalKey<FormState>();
  // String deviceToken = "";
  // Future<void> getDeviceTokenToSendNotification() async {
  //   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  //   final token = await _fcm.getToken();
  //   // print("Your Toke Value is : ${token}");
  //   deviceToken = token.toString();
  // }

  // requestNoti() async {
  //   await Permission.notification.isDenied.then((value) {
  //     if (value) {
  //       Permission.notification.request();
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // requestNoti();

  //   // getDeviceTokenToSendNotification();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
          // title: Text("Login"),
          actions: [
            Image.asset("asset/urban_logo.png")
          ],
        ),
        body: Obx(
          ()=> SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                
                Ink(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          // width: 600, // Ensures full width
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              repeat: ImageRepeat.noRepeat,
                              image: AssetImage("asset/road_image.png"),
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-50, 0),
                        child: SizedBox(
                                            // height: 200,
                                            width: double.infinity,
                                            // width: 200,
                                            child: Center(
                                              child: Image.asset(
                                                "asset/delivery_boy.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                      )
                    ],
                  ),
                ),
                
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                      // width: MediaQuery.sizeOf(context).width*1,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colo.white,
                        boxShadow: [
                          BoxShadow(color: Colo.black,blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(16)
                      ),
                      alignment: Alignment.center,
                      child: Form(
                            key: _formeyLogin,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                    controller: controller.phone,
                                    val: "contact",
                                    labelTest: "",
                                    inputFormatter: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    keyboard: TextInputType.number,
                                    prefix: Icon(Icons.account_circle),
                                    hintText: "Mobile Number"),
                           
                                SizedBox(
                                  height: 20,
                                ),
                                // login.isLoading
                                //     ? CircularProgressIndicator()
                                //     : 
                                   controller.isLoading.value?Center(child: CircularProgressIndicator(),): SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                     child: ElevatedButton.icon(
                                          // context: context,
                                          
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(8),
                                            backgroundColor: Colo.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16)
                                            )
                                          ),
                                          label:Text("Send OTP",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colo.black),) ,
                                          iconAlignment: IconAlignment.end,
                                          icon: Icon(Icons.arrow_forward,size: 20,),
                                          onPressed: () {
                                            controller.login().then((v){
                                              if (v) {
                                             Get.toNamed(Paths.check_email);   
                                              }
                                            });
                                          
                                          }),
                                   ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                ],
                            ))
                     
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
