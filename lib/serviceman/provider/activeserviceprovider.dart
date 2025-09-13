// import 'package:design/serviceman/api/activeserviceapi.dart';
// import 'package:design/serviceman/model/activeservicemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/activeserviceapi.dart';
import 'package:flutter_application_1/serviceman/model/activeservicemodel.dart';


class ActiveServiceProvider with ChangeNotifier {
  final ActiveServiceapi _apiService = ActiveServiceapi();
  bool _isLoading = false;
  ActiveServiceandTodaysTask? _activeServiceRequest;

  bool get isLoading => _isLoading;
  ActiveServiceandTodaysTask? get activeServiceRequest => _activeServiceRequest;

  Future<void> fetchActiveServiceRequests(String token) async {
    _isLoading = true;
    notifyListeners();

    _activeServiceRequest = await _apiService.fetchActiveServiceRequests(token);

    _isLoading = false;
    notifyListeners();
  }
}
