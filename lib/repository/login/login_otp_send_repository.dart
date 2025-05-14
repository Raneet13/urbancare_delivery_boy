import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/app_url.dart';
import '../../data/network/api_helper.dart';


class AuthApiRepository {
  //login Repository
  Future<dynamic> loginApi({required phoneNo}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'contact_no': phoneNo,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.sendOtpLogin, formData: formData);

      // response = await loginOtpModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
    Future<dynamic> veryfyOtp({required String phoneNo,required String otp,required String token}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'contact_no': phoneNo,
        'otp':otp,
        'token':token
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
