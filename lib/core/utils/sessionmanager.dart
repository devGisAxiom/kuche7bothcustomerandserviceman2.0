import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// adjust path

class SessionManager {
  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // remove saved token

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
