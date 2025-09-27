import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/model/customerprofile.dart';
import 'package:flutter_application_1/customer/api/customerprofileapi.dart';

class ProfileProvider with ChangeNotifier {
  CustomerProfile? _profile;
  bool _isLoading = false;

  CustomerProfile? get profile => _profile;
  bool get isLoading => _isLoading;

  Future<void> loadProfile(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    _profile = await CustomerProfileApi.fetchProfile(context);

    _isLoading = false;
    notifyListeners();
  }
}
