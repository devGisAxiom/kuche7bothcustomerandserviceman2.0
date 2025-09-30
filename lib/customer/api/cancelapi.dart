import 'dart:convert';
import 'package:flutter_application_1/customer/model/cancelmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class CancelService {
  static const String baseUrl =
      "https://pms.gisaxiom.com/api/customers/service/request/cancel";

  static Future<CancelModel?> cancelRequest(
    int idCustomerServiceRequest,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception("Token not found. Please login again.");
    }

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "id_customer_service_request": idCustomerServiceRequest,
      }),
    );

    if (response.statusCode == 200) {
      return CancelModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to cancel request: ${response.statusCode}");
    }
  }
}
