import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/filetypeapi.dart';

import '../model/filetype.dart';

class FileTypesProvider with ChangeNotifier {
  List<Data> _fileTypes = [];
  bool _isLoading = false;
  String? _error;
  final FileTypesApiService _apiService;

  FileTypesProvider({FileTypesApiService? apiService})
    : _apiService = apiService ?? FileTypesApiService();

  List<Data> get fileTypes => _fileTypes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchFileTypes(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      _fileTypes = await _apiService.fetchFileTypes(token);
      _error = null;
    } catch (e) {
      _error = 'Failed to load file types: ${e.toString()}';
      _fileTypes = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
