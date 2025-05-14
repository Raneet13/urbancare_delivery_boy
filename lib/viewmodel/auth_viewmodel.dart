

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/login/login_otp_send_repository.dart';
import '../static/show_toast/showTost_msg.dart';

class AuthViewmodel extends GetxController {
    var isLoading = false.obs;
// Rx<AllOrderModel> allorder = AllOrderModel().obs;
 TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
    TextEditingController pinController = TextEditingController();
TextEditingController forgetnpasContact= TextEditingController();
Rx<String> otp = "".obs;
Rx<String> token = "".obs;

//resend OTP
//   bool resend =false;
// var resendOtp = "";
    Rx<bool> isButtonDisabled = true.obs;
Rx<bool> isResend = false.obs;
 Timer? _timer;
   Rx<int> secondsRemaining = 30.obs;
  // @override
  // void onInit() {
  //   viewAllorder();
  //   super.onInit();
  // }
     void startCountdown() {
   
secondsRemaining(30);
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (secondsRemaining > 0) {
        
         secondsRemaining(secondsRemaining.value-1);
        
      } else {
        
          isButtonDisabled (false);
      
        timer.cancel();
      }
    });
  }
  Future login() async {
    late bool rsp =false;
    isLoading(true);
    try {
     if(phone.text==null||phone.text.isEmpty){
      ShowToast(msg: "Enter Mobile Number");
     }else{
       if (phone.text.length!=10) {
        ShowToast(msg: "Enter 10 digit mobile Number");
      } else {
         var resp = await AuthApiRepository().loginApi(phoneNo: phone.text);
      if (resp != null &&resp['success']) {
        isLoading(false);
        rsp=true;
        print(resp);
        // otp.value =resp["otp"];
// pinController.text = resp["otp"].toString();
        token.value =resp["token"];
        // ShowToast(msg: resp["message"].toString());
      }else{
        ShowToast(msg: resp["message"].toString());
      }
      }
     }
     
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
   Future otpVerify() async {
    late bool rsp =false;
    isLoading(true);
    try {
     if(pinController.text==null||pinController.text.isEmpty){
      ShowToast(msg: "First Enter OTP");
     }else{
       if (pinController.text.length!=6) {
        ShowToast(msg: "First Enter 6 digit OTP");
      } else {
         var resp = await AuthApiRepository().veryfyOtp(phoneNo: phone.text, otp: pinController.text, token: token.value);
      if (resp != null&&resp["success"]) {
        isLoading(false);
           final prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId',resp["user"]["id"].toString());
        rsp=true;
        print(resp);
        // otp.value =resp["otp"];
// pinController.text = resp["otp"].toString();
//         token.value =resp["token"];
//         ShowToast(msg: resp["message"].toString());
      }else{
        ShowToast(msg: resp["message"].toString());
      }
      }
     }
     
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
   Future logout() async {
   late bool rsp =false;
 
        final prefs = await SharedPreferences.getInstance();
       await prefs.remove('userId').then((v){
rsp =true;
       });
       
   return rsp;
  }
  void dispose(){
    super.dispose();
     _timer?.cancel();
      secondsRemaining(30);
        isButtonDisabled (true);
     }

}