import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceRequestList {
  String? status;
  int? errorCode;
  String? message;
  List<Data>? data;

  ServiceRequestList({this.status, this.errorCode, this.message, this.data});

  ServiceRequestList.fromJson(Map<String, dynamic> json) {
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
  int? statusId;
  int? idProduct;
  String? brand;
  String? createdDate;
  String? createdTime;
  List<Files>? files;

  Data({
    this.id,
    this.note,
    this.status,
    this.statusId,
    this.idProduct,
    this.brand,
    this.createdDate,
    this.createdTime,
    this.files,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    status = json['status'];
    statusId = json['status_id'];
    idProduct = json['id_product'];
    brand = json['brand'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
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
    data['status_id'] = this.statusId;
    data['id_product'] = this.idProduct;
    data['brand'] = this.brand;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
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

class ServiceRequestListProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<Data> _requests = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Data> get requests => _requests;

  Future<void> fetchServiceRequests() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        _errorMessage = "⚠️ No token found in SharedPreferences";
        _isLoading = false;
        notifyListeners();
        return;
      }

      final response = await http.get(
        Uri.parse("https://pms.gisaxiom.com/api/customers/service/requests"),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final model = ServiceRequestList.fromJson(jsonResponse);
        _requests = model.data ?? [];
        print("✅ Fetched service requests ${_requests}");
      } else {
        _errorMessage =
            "Error ${response.statusCode}: ${response.reasonPhrase}";
      }
    } catch (e) {
      _errorMessage = "❌ Exception: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
