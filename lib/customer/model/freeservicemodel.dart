import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';

class FreeServiceModel {
  String? status;
  int? errorCode;
  String? message;
  List<Data>? data;

  FreeServiceModel({this.status, this.errorCode, this.message, this.data});

  FreeServiceModel.fromJson(Map<String, dynamic> json) {
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
  String? serviceDate;
  int? id;
  String? status;

  Data({this.serviceDate, this.id, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    serviceDate = json['service_date'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_date'] = this.serviceDate;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}

class FreeServiceService {
  static Future<FreeServiceModel?> fetchFreeServices(int idProduct) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final url = Uri.parse(
        "https://pms.gisaxiom.com/api/customers/free-service-details/$idProduct",
      );

      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        print(idProduct);
        return FreeServiceModel.fromJson(jsonBody);
      } else {
        throw Exception("Failed to load: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

// class FreeServiceProvider with ChangeNotifier {
//   bool isLoading = false;
//   FreeServiceModel? freeService;
//   String? errorMessage;

//   Future<void> loadFreeServices(BuildContext context) async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
//       if (themeProvider.idProduct != null) {
//         freeService = await FreeServiceService.fetchFreeServices(
//           themeProvider.idProduct!,
//         );
//       } else {
//         errorMessage = "No product selected";
//       }
//     } catch (e) {
//       errorMessage = e.toString();
//     }

//     isLoading = false;
//     notifyListeners();
//   }
// }
class FreeServiceProvider with ChangeNotifier {
  bool isLoading = false;
  FreeServiceModel? freeService;
  String? errorMessage;

  Future<void> loadFreeServices(int idProduct) async {
    isLoading = true;
    errorMessage = null;
    freeService = null;
    notifyListeners();

    try {
      freeService = await FreeServiceService.fetchFreeServices(idProduct);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
