import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:flutter_application_1/customer/model/customerprofile.dart';
import 'package:flutter_application_1/core/storage/usepreference.dart';

import 'package:http/http.dart' as http;

class CustomerProfileApi {
  static const String _url = "https://pms.gisaxiom.com/api/customers/profile";

  static Future<CustomerProfile?> fetchProfile(context) async {
    try {
      String? token = await UserPreferences.getToken();

      if (token == null) {
        print("⚠️ No token found!");
        return null;
      }

      final response = await http.get(
        Uri.parse(_url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print("✅ Profile fetched: $jsonData");
        return CustomerProfile.fromJson(jsonData);
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
        print("⚠️ Error: ${response.statusCode}, Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return null;
    }
  }
}
