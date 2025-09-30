import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/api/cancelapi.dart';
import 'package:flutter_application_1/customer/model/cancelmodel.dart';

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
