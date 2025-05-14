import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:urbancare_delivery_boy/static/navigation_route/app_route.dart';

import '../../../static/app_color.dart';
import '../../../static/custom_elevated_button.dart';
import '../../../static/custom_textfield.dart';
import '../../viewmodel/auth_viewmodel.dart';

class ForgetPassword extends GetView<AuthViewmodel>  {
  


//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {


  @override
  Widget build(BuildContext context) {
    controller.startCountdown();
    return Scaffold(
        // backgroundColor: Colo.primaryColor,
        appBar: AppBar(
          title: Text("Veryfy OTP"),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child:  Obx(
              ()=> Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 200,
                    //   // width: 200,
                    //   child: Image.asset(
                    //     "assets/logo/royal_matka_header.png",
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    SizedBox(
                      // height: 400,
                      child: Form(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         PinCodeTextField(
                          autoDisposeControllers:false,
                appContext: context,
                length: 6, // Set to 4 for a 4-digit PIN
                controller: controller.pinController,
                keyboardType: TextInputType.number,
                cursorColor: Colo.black,
                obscureText: false, // Optional: For hiding the input
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box, // Box-shaped PIN fields
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.grey.shade300,
                  selectedFillColor: Colors.blue.shade100,
                  activeColor: Colors.blue, // Border color when active
                  inactiveColor: Colors.grey, // Border color when inactive
                  selectedColor: Colors.blueAccent, // Border color when selected
                ),
                onCompleted: (pin) {
                  print("Completed: $pin");
                },
                onChanged: (value) {
                  print("Changed: $value");
                },
              ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // forget.isLoading
                          //     ? Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //     : 
                            controller.isLoading.value?Center(child: CircularProgressIndicator(),):  SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: customElevatedButton(
                                    context: context,
                                    buttonname: "Verify Phone",
                                    onpressed: () {
                                      controller.otpVerify().then((v){
                                        if (v) {
                                            Get.offAllNamed(Paths.nav);
                                        }
                                      });
                              
                                    
                                    }),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                           controller.isButtonDisabled.value?Align(alignment: Alignment.centerRight, child: Padding(
                   padding: const EdgeInsets.only(right: 10),
                   child: Text("Resend OTP ${controller.secondsRemaining.value} sec"),
                 )): Align(
                    alignment: Alignment.centerRight,
                    child:controller.isResend.value?SizedBox(height: 20,width: 20,child: CircularProgressIndicator(),): TextButton(
                      style: TextButton.styleFrom(
                      foregroundColor: Colo.black,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size.zero
                      ),
                      onPressed: (){
                        if (controller.isLoading.value) {
                          null;
                        }else{
                          controller.startCountdown();
                          controller.isButtonDisabled (true);
                          controller.startCountdown();

                            controller.login();
                        }
                   
                    }, child: Text("Resend OTP",style: TextStyle(fontSize: 16),)),
                  ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offAllNamed(Paths.login); 
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LoginScreen()));
                              },
                              child: Text("Edit Mobile Number"))
                        ],
                      )),
                    )
                  ],
                ),
            ),
          ),
        ));
  }
}
