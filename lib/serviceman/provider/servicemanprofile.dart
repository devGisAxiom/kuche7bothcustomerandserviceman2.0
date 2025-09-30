// import 'package:design/serviceman/api/profileapi.dart';
// import 'package:design/serviceman/model/servicemanprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/profileapi.dart';
import 'package:flutter_application_1/serviceman/model/servicemanprofile.dart';


class ServiceManProviderProfile with ChangeNotifier {
  final ServiceManProfileApi _api = ServiceManProfileApi();
  ServiceManProfile? _serviceManProfile;
  bool _isLoading = false;
  String? _errorMessage;

  ServiceManProfile? get serviceManProfile => _serviceManProfile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProfile(String token,BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final response = await _api.fetchServiceManProfile(token,context);
    if (response != null) {
      _serviceManProfile = response;
    } else {
      _errorMessage = "Failed to load data ${response}";
      
    }

    _isLoading = false;
    notifyListeners();
  }
}
