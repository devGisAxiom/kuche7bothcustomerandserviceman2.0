import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/api/loginapi.dart';
import 'package:flutter_application_1/customer/model/login.dart';

import 'package:flutter_application_1/core/storage/usepreference.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Kuchi7 extends ChangeNotifier {
  bool _isLoading = false;
  String _userType = '';
  ModelLogin? _loginData;

  bool get isLoading => _isLoading;
  String get userType => _userType;
  ModelLogin? get loginData => _loginData;

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void clearLoginData() {
    //clear login data
    _loginData = null;
    notifyListeners();
    UserPreferences.clearPreferences();
  }

  void setUserType(String userType) {
    _userType = userType;
    notifyListeners();
  }

  void setLoginData(ModelLogin? loginData) {
    _loginData = loginData;
    notifyListeners();
  }

  Future login(String email, String password, int userType) async {
    setLoading(true);

    try {
      // final response = await ApiService.loginuser(email, password, userType);
      final api = ApiService();
      final response = await api.login(email, password, userType);

      if (response != null && response.status == 'success') {
        _userType = userType == 1 ? 'Customer' : 'ServiceMan';
        _loginData = response;
        return _loginData;
      } else {
        print("$response ///////////////");
        showToast("invalid email or password");
        throw Exception("invalid email or password");
      }
    } on Exception catch (e) {
      print('Login error: $e');
      showToast('Login error: $e');
      return null;
    } finally {
      setLoading(false);
    }
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 18.0,
  );
}
