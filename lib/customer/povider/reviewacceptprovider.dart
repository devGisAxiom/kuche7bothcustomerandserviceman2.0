import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? _response;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Map<String, dynamic>? get response => _response;

  Future<void> acceptTask({
    required BuildContext context,
    required String taskId,
    required String status,
    String? note,
    String? customerReview,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        _errorMessage = "No token found";
        _isLoading = false;
        notifyListeners();
        return;
      }

      final url = Uri.parse(
        "https://pms.gisaxiom.com/api/customers/accept/task",
      );

      final res = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'task_id': taskId,
          'status': status,
          'note': note ?? '',
          'customer_review': customerReview ?? '',
        }),
      );

      if (res.statusCode == 200) {
        _response = jsonDecode(res.body);
      } else if (res.statusCode == 401) {
        SessionManager.logout(context);
      } else {
        _errorMessage = "Failed: ${res.statusCode} - ${res.body}";
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
