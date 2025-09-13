import 'dart:convert';

import 'package:flutter/material.dart';

class CustomerProfile {
  String? status;
  int? errorCode;
  String? message;
  Data? data;

  CustomerProfile({this.status, this.errorCode, this.message, this.data});

  CustomerProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? contactNumber;
  int? id;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? pincode;
  String? location;

  Data({
    this.name,
    this.email,
    this.contactNumber,
    this.id,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.pincode,
    this.location,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    id = json['id'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact_number'] = this.contactNumber;
    data['id'] = this.id;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['location'] = this.location;
    return data;
  }
}
