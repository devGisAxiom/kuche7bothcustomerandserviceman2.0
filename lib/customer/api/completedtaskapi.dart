import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:flutter_application_1/customer/model/completedtaskmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CompletedTaskService {
  static Future<CompltedTask?> fetchCompletedTasks(context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final url = Uri.parse(
        "https://pms.gisaxiom.com/api/customers/service/requests/completed",
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
        return CompltedTask.fromJson(jsonBody);
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
        throw Exception("Failed: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
