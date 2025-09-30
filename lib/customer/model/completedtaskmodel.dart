import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CompltedTask {
  String? status;
  int? errorCode;
  String? message;
  List<Data>? data;

  CompltedTask({this.status, this.errorCode, this.message, this.data});

  CompltedTask.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? note;
  String? status;
  int? taskId;
  int? statusId;
  int? idProduct;
  String? serviceIssue;
  String? brand;
  String? createdDate;
  String? createdTime;
  int? taskAcceptCustomer;
  int? customerReview;
  String? customerNote;
  List<Files>? files;

  Data({
    this.id,
    this.note,
    this.status,
    this.taskId,
    this.statusId,
    this.idProduct,
    this.serviceIssue,
    this.brand,
    this.createdDate,
    this.createdTime,
    this.taskAcceptCustomer,
    this.customerReview,
    this.customerNote,
    this.files,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    status = json['status'];
    taskId = json['task_id'];
    statusId = json['status_id'];
    idProduct = json['id_product'];
    serviceIssue = json['service_issue'];
    brand = json['brand'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    taskAcceptCustomer = json['task_accept_customer'];
    customerReview = json['customer_review'];
    customerNote = json['customer_note'];
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['status'] = this.status;
    data['task_id'] = this.taskId;
    data['status_id'] = this.statusId;
    data['id_product'] = this.idProduct;
    data['service_issue'] = this.serviceIssue;
    data['brand'] = this.brand;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['task_accept_customer'] = this.taskAcceptCustomer;
    data['customer_review'] = this.customerReview;
    data['customer_note'] = customerNote;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Files {
  int? id;
  String? file;
  String? fileType;

  Files({this.id, this.file, this.fileType});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    data['file_type'] = this.fileType;
    return data;
  }
}
