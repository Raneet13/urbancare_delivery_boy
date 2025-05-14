import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/static/navigation_route/app_route.dart';

import '../../../static/app_color.dart';
import '../../../static/custom_elevated_button.dart';
import '../../../static/custom_textfield.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colo.primaryColor,
        appBar: AppBar(
          // title: Text("Login"),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15),
          // child: SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    // width: 200,
                    child: Image.asset(
                      "asset/teashop.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    // height: 400,
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                            // controller: forget.forgetnpasVerifyotp,
                            hintText: "Verification OTP",
                            labelTest: "OTP",
                            prefix: Icon(Icons.chat)),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            // controller: forget.forgetnpasnewPass,
                            hintText: "Password",
                            labelTest: "Enter new Password",
                            // obscure: !forget.showVisiblePass,
                            prefix: Icon(Icons.account_circle)),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            // controller: forget.forgetnpasretypePass,
                            hintText: "Password",
                            labelTest: "Retype Password",
                            // obscure: !forget.showVisiblePass,
                            prefix: Icon(Icons.lock)),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        TextButton(
                            onPressed: () {
                              // forget.visiblepassword();
                            },
                            child: Text("Visible Password")),
                        SizedBox(
                          height: 20,
                        ),
                        // forget.isLoading
                        //     ? Center(
                        //         child: CircularProgressIndicator(),
                        //       )
                        //     : 
                            customElevatedButton(
                                context: context,
                                buttonname: "Change Password",
                                onpressed: () {
                                  // if (forget.forgetnpasVerifyotp.text ==
                                  //     forget.forgetpass?.messages?.status
                                  //         ?.loginOtp
                                  //         .toString()) {
                                  //   if (forget.forgetnpasnewPass.text
                                  //           .isNotEmpty &&
                                  //       forget.forgetnpasnewPass.text ==
                                  //           forget.forgetnpasretypePass.text) {
                                  //     forget.passwordChangeVew().then((v) {
                                  //       if (v) {
                                  //         Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     LoginScreen()));
                                  //       }
                                  //     });
                                  //   } else {
                                  //     ShowToast(msg: "Enter Password");
                                  //   }
                                  // } else {
                                  //   ShowToast(msg: "Enter Correct OTP");
                                  // }

                                  // BottomNavigationScreen()
                                }),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(Paths.login);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginScreen()));
                            },
                            child: Text("Login"))
                      ],
                    )),
                  )
                ],
              )
          ),
        );
  }
}
