import 'dart:convert';

import 'package:flutter_application_1/customer/model/customerprofile.dart';
import 'package:flutter_application_1/core/storage/usepreference.dart';

import 'package:http/http.dart' as http;

class CustomerProfileApi {
  static const String _url = "https://pms.gisaxiom.com/api/customers/profile";

  static Future<CustomerProfile?> fetchProfile() async {
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
