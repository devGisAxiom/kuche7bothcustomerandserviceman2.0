//import 'package:design/serviceman/api/servicemancompletedlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/servicemancompletedlist.dart';
import 'package:flutter_application_1/serviceman/model/servicemancompleted.dart';
// import 'package:design/serviceman/model/servicemancompleted.dart';

class ServiceManProvider extends ChangeNotifier {
  ServiceManCompletedTask? _completedTask;
  bool _isLoading = false;
  String? _errorMessage;

  ServiceManCompletedTask? get completedTask => _completedTask;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCompletedTasks(String token,BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _completedTask = await ServicemanCompletedlistApi.fetchCompletedTasks(token,context);
    } catch (error) {
      _errorMessage = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
