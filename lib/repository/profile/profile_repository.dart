import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/app_url.dart';
import '../../data/network/api_helper.dart';


class ProfileApiRepository {
  //login Repository
  Future<dynamic> viewProfile({required String userId}) async {
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
    Future<dynamic> updateProfile({required String phoneNo,required String name,required String email,required String gender,required String contact,required String altContact,required profile_image}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'user_id': phoneNo,
        'name':name,
        'email':email,
        'gender':gender,
        'contact_no':contact,
        'alter_contact_no':altContact,
        'profile_image':profile_image,
        'address':""
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.verifyOtpLogin, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

}
