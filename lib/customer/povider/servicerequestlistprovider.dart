import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/customer/model/servicelistmodel.dart';

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
