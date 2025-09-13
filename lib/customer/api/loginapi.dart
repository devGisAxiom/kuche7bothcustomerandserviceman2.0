import 'dart:convert';

import 'package:flutter_application_1/customer/model/login.dart';
import 'package:flutter_application_1/core/storage/usepreference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = "https://pms.gisaxiom.com/api";

  Future<ModelLogin?> login(String email, String password, int userType) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email and Password cannot be empty");
    }
    if (userType != 1 && userType != 2) {
      throw Exception("Invalid user type selected");
    }

    final url = Uri.parse("$_baseUrl/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email.trim(),
        "password": password.trim(),
        "user_type": userType,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["status"] == "success") {
      final loginModel = modelLoginFromJson(response.body);
      // final token = data['token'];
      print(
        "loginModeltoken ${loginModel.token} ,${loginModel.userType},${loginModel.status}",
      ); // JWT string
      print(loginModel.userType); // int
      print(loginModel.status); // "success"

      await UserPreferences.setToken(data["token"]);
      await UserPreferences.setSelectedValue(loginModel.userType ?? 0);
      return ModelLogin.fromJson(data);
    } else {
      throw Exception(data["message"] ?? "Login failed");
    }
  }
}
