import 'dart:convert';

import 'package:flutter_application_1/customer/model/selectbrandmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BrandService {
  final String baseUrl =
      "https://pms.gisaxiom.com/api/customers/products-purchased";

  Future<SelectBrand?> fetchBrands() async {
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
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
    return null;
  }
}
