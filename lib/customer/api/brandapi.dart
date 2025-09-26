import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:flutter_application_1/customer/model/selectbrandmodel.dart';
import 'package:flutter_application_1/customer/screen/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BrandService {
  final String baseUrl =
      "https://pms.gisaxiom.com/api/customers/products-purchased";

  Future<SelectBrand?> fetchBrands(context) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      print("No token found in SharedPreferences");
      return null; // or handle the absence of a token as needed
    }
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return SelectBrand.fromJson(jsonData);
      } else if (response.statusCode == 401) {
        print("Error: 401 Unauthorized - Token expired or invalid.");
        // return null; // Return null to signal a 401 error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Session expired. Please log in again.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 2),
          ),
        );
        SessionManager.logout(context);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
    return null;
  }
}
