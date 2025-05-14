import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../static/app_color.dart';
import '../../static/custom_elevated_button.dart';
import '../../static/custom_textfield.dart';
import '../../static/navigation_route/app_route.dart';
import '../../static/show_toast/showTost_msg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKeySignup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colo.primaryColor,
      appBar: AppBar(
        title: Text(
          "Signup",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colo.white),
        ),
      ),
      bottomSheet: null,
      bottomNavigationBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15,bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              SizedBox(
                height: 150,
                // width: 150,
                child: Image.asset(
                  "asset/urban_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                // height: 400,
                child:  Form(
                      key: _formKeySignup,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField(
                              val: "name",
                              // controller: signup.name,
                              hintText: "Name",
                              labelTest: "Enter Name",
                              prefix: Icon(Icons.account_circle)),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              val: "email",
                              // controller: signup.email,
                              hintText: "Email Address",
                              labelTest: "Enter Email",
                              prefix: Icon(Icons.email)),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              val: "contact",
                              inputFormatter: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboard: TextInputType.number,
                              // controller: signup.phone,
                              hintText: "Mobile Number",
                              labelTest: "Enter Mobile",
                              prefix: Icon(Icons.call)),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            val: "pass",
                            // controller: signup.password,
                            hintText: "Enter Passord",
                            labelTest: "Enter Passord",
                            prefix: Icon(Icons.lock),
                            // obscure: !signup.signupvisible,
                            // suffix: IconButton(
                            //   icon: Icon(
                            //     signup.signupvisible
                            //         ? Icons.visibility
                            //         : Icons.visibility_off,
                            //   ),
                            //   onPressed: () {
                            //     signup
                            //         .passwordVisiblesignup(); // Toggle visibility
                            //   },
                            // ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            // val: "code",
                            // controller: signup.inviteCode,
                            hintText: "Code",
                            labelTest: "       Invite Code (optional)",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // signup.isLoading
                          //     ? CircularProgressIndicator()
                          //     : 
                              customElevatedButton(
                                  context: context,
        //                                 onpressed: () {
        //                                   // print("This is the sigup page");
        //                                   if (_formKeySignup.currentState!.validate()) {
        //                                     signup.signupViewmodel();
        //                                   } else {
        //                                     if (signup.name.text.isEmpty) {
        //                                       ShowToast(msg: "Name isRequired");
        //                                     } else if (signup.email.text.isEmpty) {
        //                                       ShowToast(msg: "Email Is Required");
        //                                     } else if (signup.phone.text.isEmpty) {
        //                                       ShowToast(
        //                                           msg: "Phone Number Is Required");
        //                                     } else if (signup.password.text.isEmpty) {
        //                                       ShowToast(msg: "Password Is Required");
        //                                     } else {
        // // ShowToast(msg: "Password Is Required");
        //                                     }
        //                                     // ShowToast(msg: "Enter Text All Field");
        //                                   }
        //                                 },
                                  buttonname: "Sign-Up",
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                          Get.toNamed(Paths.login);                             // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginScreen()));
                            },
                            child: Text("Login"),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // Zero padding
                              minimumSize:
                                  Size(0, 0), // Minimum size of the button
                              tapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // Shrink the tap target size
                            ),
                          ),
                        ],
                      )),
              
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
