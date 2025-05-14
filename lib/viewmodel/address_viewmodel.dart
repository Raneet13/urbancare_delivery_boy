

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbancare_delivery_boy/repository/home/home_repository.dart';

import '../model/address_model.dart';

class addressViewmodel extends GetxController {
    var isLoading = false.obs;
Rx<AddressModel?> address = AddressModel().obs;
TextEditingController phone = TextEditingController();
  TextEditingController addr1 = TextEditingController();
  TextEditingController addr2 = TextEditingController();
  TextEditingController city = TextEditingController();
    TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
   Rx<Address?> selectedAddress =Address().obs;
  @override
  void onInit() {
    addressView();
    super.onInit();
  }
  Future addressView() async {
    late bool rsp =false;
    isLoading(true);
    try {
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().ViewaddressApi(userId: userId);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
address.value = AddressModel.fromJson(resp);
        rsp=true;
        
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
    Future addAddress() async {
    late bool rsp =false;
    isLoading(true);
    try {
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().addAddressApi(userId: userId,phone: phone.text,addr1: addr1.text,addr2: addr2.text,city: city.text,state: state.text,zip: zip.text);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
        addressView();
        rsp=true;
        
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
  //update profile
      Future updateAddress({required String addresI}) async {
    late bool rsp =false;
    isLoading(true);
    try {
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().addAddressApi(userId: userId,phone: phone.text,addr1: addr1.text,addr2: addr2.text,city: city.text,state: state.text,zip: zip.text);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
        addressView();
        rsp=true;
        
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }

fillAddress({required Address addr}){
phone.text =addr.phoneNumber??"";
addr1.text =addr.adress1??"";
addr2.text =addr.adress2??"";
state.text =addr.state??"";
city.text =addr.city??"";
zip.text=addr.zipCode.toString()??"";

}
    void selectAddress(Address address) {
    selectedAddress.value = address;
    // print(_selectedAddress);
    // notifyListeners();
  }
}