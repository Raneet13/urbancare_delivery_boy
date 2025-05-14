// To parse this JSON data, do
//
//     final orderdetailsModel = orderdetailsModelFromJson(jsonString);

import 'dart:convert';

OrderdetailsModel orderdetailsModelFromJson(String str) => OrderdetailsModel.fromJson(json.decode(str));

String orderdetailsModelToJson(OrderdetailsModel data) => json.encode(data.toJson());

class OrderdetailsModel {
    bool? success;
    Data? data;

    OrderdetailsModel({
        this.success,
        this.data,
    });

    factory OrderdetailsModel.fromJson(Map<String, dynamic> json) => OrderdetailsModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? orderNo;
    String? orderedBy;
    int? statusId;
    String? orderStatus;
    String? pickedUpTime;
    dynamic deliveryTime;
    String? deliveryBoyPickupTime;
    dynamic deliveryBoyDeliveredTime;
    Address? address;
    Payment? payment;
    List<Item>? items;

    Data({
        this.id,
        this.orderNo,
        this.orderedBy,
        this.statusId,
        this.orderStatus,
        this.pickedUpTime,
        this.deliveryTime,
        this.deliveryBoyPickupTime,
        this.deliveryBoyDeliveredTime,
        this.address,
        this.payment,
        this.items,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        orderNo: json["order_no"],
        orderedBy: json["ordered_by"],
        statusId: json["status_id"],
        orderStatus: json["order_status"],
        pickedUpTime: json["picked_up_time"],
        deliveryTime: json["delivery_time"],
        deliveryBoyPickupTime: json["delivery_boy_pickup_time"],
        deliveryBoyDeliveredTime: json["delivery_boy_delivered_time"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "ordered_by": orderedBy,
        "status_id": statusId,
        "order_status": orderStatus,
        "picked_up_time": pickedUpTime,
        "delivery_time": deliveryTime,
        "delivery_boy_pickup_time": deliveryBoyPickupTime,
        "delivery_boy_delivered_time": deliveryBoyDeliveredTime,
        "address": address?.toJson(),
        "payment": payment?.toJson(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Address {
    String? address;
    String? city;
    String? state;
    int? zipCode;
    String? phoneNum;
    String? regPhoneNum;
    String? regAltPhoneNum;

    Address({
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.phoneNum,
        this.regPhoneNum,
        this.regAltPhoneNum,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        phoneNum: json["phone_num"],
        regPhoneNum: json["reg_phone_num"],
        regAltPhoneNum: json["reg_alt_phone_num"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "phone_num": phoneNum,
        "reg_phone_num": regPhoneNum,
        "reg_alt_phone_num": regAltPhoneNum,
    };
}

class Item {
    int? id;
    int? quantity;
    int? barcodeCount;
    String? name;
    String? service;
    String? price;
    String? barcodeNo;

    Item({
        this.id,
        this.quantity,
        this.barcodeCount,
        this.name,
        this.service,
        this.price,
        this.barcodeNo,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"],
        barcodeCount: json["barcode_count"],
        name: json["name"],
        service: json["service"],
        price: json["price"],
        barcodeNo: json["barcode_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "barcode_count": barcodeCount,
        "name": name,
        "service": service,
        "price": price,
        "barcode_no": barcodeNo,
    };
}

class Payment {
    String? amount;
    int? restAmount;
    String? paymentMethod;

    Payment({
        this.amount,
        this.restAmount,
        this.paymentMethod,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json["amount"],
        restAmount: json["rest_amount"],
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "rest_amount": restAmount,
        "payment_method": paymentMethod,
    };
}
