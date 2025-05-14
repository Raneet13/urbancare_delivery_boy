import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbancare_delivery_boy/repository/home/home_repository.dart';
import 'package:urbancare_delivery_boy/static/show_toast/showTost_msg.dart';

import '../model/home_model.dart';
import '../model/order_details_model.dart';

class homeViewmodel extends GetxController {
    var isLoading = false.obs;
Rx<HomeModel?> home = HomeModel().obs;
Rx<OrderdetailsModel>orderDetails = OrderdetailsModel().obs;
  @override
  void onInit() {
    homeView();
    super.onInit();
  }
  Future homeView() async {
    late bool rsp =false;
    isLoading(true);
    try {
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().homeApi(userId: userId);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
home.value = HomeModel.fromJson(resp);
        rsp=true;
        
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
  //update profile
    Future orderdetail({required String orderId}) async {
    late bool rsp =false;
    isLoading(true);
    try {
      //  final prefs = await SharedPreferences.getInstance();
      //  String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().orderDetails(orderId: orderId);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        // print(resp);
orderDetails.value = OrderdetailsModel.fromJson(resp);
        rsp=true;
        
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
Future scanBarcod({required String orderId,required String barcodeNum}) async {
    late bool rsp =false;
    isLoading(true);
    try {
      //  final prefs = await SharedPreferences.getInstance();
      //  String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().barcodeScan(orderId: orderId, barcodeNum: barcodeNum);
      print(resp);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        // print("Api response of single barcode submit  :  ${resp}");
        ShowToast(msg: "${resp["message"].toString()}");
       
        orderdetail(orderId: orderId);
// orderDetails.value = OrderdetailsModel.fromJson(resp);
        rsp=true;
      
        }else{
 ShowToast(msg: "${resp["error"].toString()}");
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
  Future changeDelsts({required String orderId,status}) async {
    late bool rsp =false;
    isLoading(true);
    try {
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().pickupStsupdate(orderId: orderId,status: status,userId: userId);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
        homeView();
// orderDetails.value = OrderdetailsModel.fromJson(resp);
        rsp=true;
        
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
  Future deliveryboyDEliverUser({required String contact}) async {
    late String rsp ="";
    isLoading(true);
    try {
      //  final prefs = await SharedPreferences.getInstance();
      //  String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().deliveredUSer(contact_no: contact);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
        // print("Api response of single barcode submit  :  ${resp}");
        // ShowToast(msg: "${resp["error"].toString()}");
        // orderdetail(orderId: orderId);
// orderDetails.value = OrderdetailsModel.fromJson(resp);
        rsp=resp["otp"].toString();
      
        }else{
          ShowToast(msg: "${resp["error"].toString()}");
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
}