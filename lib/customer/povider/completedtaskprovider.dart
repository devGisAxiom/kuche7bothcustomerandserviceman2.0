import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/api/completedtaskapi.dart';
import 'package:flutter_application_1/customer/model/completedtaskmodel.dart';

class CompletedTaskProvider with ChangeNotifier {
  bool isLoading = false;
  CompltedTask? completedTask;
  String? errorMessage;

  Future<void> loadCompletedTasks(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      completedTask = await CompletedTaskService.fetchCompletedTasks(context);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
