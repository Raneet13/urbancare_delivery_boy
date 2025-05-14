// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    bool? success;
    dynamic error;
    String? message;
    List<Address>? addresses;

    AddressModel({
        this.success,
        this.error,
        this.message,
        this.addresses,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    };
}

class Address {
    int? id;
    String? phoneNumber;
    String? adress1;
    String? adress2;
    String? city;
    String? state;
    int? zipCode;
    bool? primaryAdress;

    Address({
        this.id,
        this.phoneNumber,
        this.adress1,
        this.adress2,
        this.city,
        this.state,
        this.zipCode,
        this.primaryAdress,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        phoneNumber: json["phone_number"],
        adress1: json["adress_1"],
        adress2: json["adress_2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        primaryAdress: json["primary_adress"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "adress_1": adress1,
        "adress_2": adress2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "primary_adress": primaryAdress,
    };
}
