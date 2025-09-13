import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/api/brandapi.dart';
import 'package:flutter_application_1/customer/model/selectbrandmodel.dart';

class BrandProvider with ChangeNotifier {
  SelectBrand? _brands;
  bool _loading = false;

  SelectBrand? get brands => _brands;
  bool get loading => _loading;

  Future<void> getBrands() async {
    _loading = true;
    notifyListeners();

    _brands = await BrandService().fetchBrands();

    _loading = false;
    notifyListeners();
  }
}
