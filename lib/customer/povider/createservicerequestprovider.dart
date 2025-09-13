import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/api/createservicerequestapi.dart';
import 'package:flutter_application_1/customer/model/createservicerequest.dart';

class ServiceRequestProvider with ChangeNotifier {
  bool _loading = false;
  String? _error;
  CreateServiceRequest? _response;

  bool get loading => _loading;
  String? get error => _error;
  CreateServiceRequest? get response => _response;

  Future<void> createService({
    required List<File> images,
    required List<File> audios,
    required List<File> videos,
    required String note, // 👈 added
    required int idProduct, // 👈 added
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final res = await ServiceRequestApi.createService(
        images: images,
        audios: audios,
        videos: videos,
        note: note,
        idProduct: idProduct,
      );
      if (res != null) {
        _response = res;
      } else {
        _error = "Something went wrong!";
      }
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}
