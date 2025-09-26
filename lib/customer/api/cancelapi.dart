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

class CancelProvider extends ChangeNotifier {
  CancelModel? _cancelModel;
  bool _isLoading = false;
  String? _errorMessage;

  CancelModel? get cancelModel => _cancelModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> cancelRequest(int requestId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _cancelModel = await CancelService.cancelRequest(requestId);
      if (_cancelModel == null || _cancelModel?.errorCode != 0) {
        _errorMessage = _cancelModel?.message ?? "Something went wrong";
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
