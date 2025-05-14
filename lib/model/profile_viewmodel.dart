// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    bool? success;
    dynamic error;
    User? user;

    ProfileModel({
        this.success,
        this.error,
        this.user,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        error: json["error"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? name;
    String? email;
    int? userRole;
    String? gender;
    String? contactNo;
    String? alterContactNo;
    dynamic address;
    String? profileImage;

    User({
        this.id,
        this.name,
        this.email,
        this.userRole,
        this.gender,
        this.contactNo,
        this.alterContactNo,
        this.address,
        this.profileImage,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        userRole: json["user_role"],
        gender: json["gender"],
        contactNo: json["contact_no"],
        alterContactNo: json["alter_contact_no"],
        address: json["address"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "user_role": userRole,
        "gender": gender,
        "contact_no": contactNo,
        "alter_contact_no": alterContactNo,
        "address": address,
        "profile_image": profileImage,
    };
}
