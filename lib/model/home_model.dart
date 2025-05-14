// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    bool? success;
    dynamic error;
    List<Order>? assignedorder;
    List<Order>? completeorder;

    HomeModel({
        this.success,
        this.error,
        this.assignedorder,
        this.completeorder,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json["success"],
        error: json["error"],
        assignedorder: json["assignedorder"] == null ? [] : List<Order>.from(json["assignedorder"]!.map((x) => Order.fromJson(x))),
        completeorder: json["completeorder"] == null ? [] : List<Order>.from(json["completeorder"]!.map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "assignedorder": assignedorder == null ? [] : List<dynamic>.from(assignedorder!.map((x) => x.toJson())),
        "completeorder": completeorder == null ? [] : List<dynamic>.from(completeorder!.map((x) => x.toJson())),
    };
}

class Order {
    int? id;
    String? orderNo;
    String? orderTime;
    int? restAmount;
    String? paymentMethod;
    String? time;
    String? status;
    Address? address;

    Order({
        this.id,
        this.orderNo,
        this.orderTime,
        this.restAmount,
        this.paymentMethod,
        this.time,
        this.status,
        this.address,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderNo: json["order_no"],
        orderTime: json["order_time"],
        restAmount: json["restAmount"],
        paymentMethod: json["payment_method"],
        time: json["time"],
        status: json["status"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "order_time": orderTime,
        "restAmount": restAmount,
        "payment_method": paymentMethod,
        "time": time,
        "status": status,
        "address": address?.toJson(),
    };
}

class Address {
    String? phoneNumber;
    String? address1;
    String? address2;
    String? city;
    String? state;
    int? zipCode;
    String? phoneNum;
    String? regPhoneNum;
    String? regAltPhoneNum;

    Address({
        this.phoneNumber,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.zipCode,
        this.phoneNum,
        this.regPhoneNum,
        this.regAltPhoneNum,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        phoneNumber: json["phone_number"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        phoneNum: json["phone_num"],
        regPhoneNum: json["reg_phone_num"],
        regAltPhoneNum: json["reg_alt_phone_num"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "phone_num": phoneNum,
        "reg_phone_num": regPhoneNum,
        "reg_alt_phone_num": regAltPhoneNum,
    };
}
