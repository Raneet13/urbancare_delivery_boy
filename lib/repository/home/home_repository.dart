import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/app_url.dart';
import '../../data/network/api_helper.dart';


class HomeApiRepository {
  //login Repository
  Future<dynamic> homeApi({required userId}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'delv_user_id': userId,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.home, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
  Future<dynamic> ViewProfileApi({required userId}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'user_id': userId,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.fetchProfile, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
    Future<dynamic> editProfile({required String userId,required img,required String gender,required String name,required String phoneNo,required String email,required String altphone}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'user_id': userId,
        'name':name,
        'email':email,
        'profile_image':img!=null? await MultipartFile.fromFile(
          img!.path,
          filename: img!.path.split('/').last,
        ):null,
        'gender': gender,
        'contact_no':phoneNo,
        'alter_contact_no':altphone
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.updateProfile, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
  Future<dynamic> ViewaddressApi({required userId}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'user_id': userId,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.viewallAddress, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
    Future<dynamic> addAddressApi({required userId,String? phone,String? addr1,String? addr2,String? city,String? state,String? zip}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'user_id': userId,
        'phone_number':phone,
        'adress_1':addr1,
        'adress_2':addr2,
        'city':city,
        'state':state,
        'zip_code':zip
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.addAddress, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
      Future<dynamic> orderDetails({required orderId}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'order_no': orderId
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.orderDe4tails, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
   Future<dynamic> barcodeScan({required orderId,required barcodeNum}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'id': orderId,
        'barcode_no':barcodeNum
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.scanBarCode, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
   Future<dynamic> pickupStsupdate({required orderId,userId,status}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'order_no': orderId,
        'delv_user_id':userId,
        'status':status
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.changePickupSts, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
   Future<dynamic> deliveredUSer({required contact_no}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'contact_no': contact_no
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.sendOtpDelivered, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

}
