// import 'package:design/model/filetype.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class FileTypesProvider with ChangeNotifier {
//   List<Data> _fileTypes = [];
//   bool _isLoading = false;
//   String? _error;

//   List<Data> get fileTypes => _fileTypes;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   Future<void> fetchFileTypes(String token) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final response = await http.get(
//         Uri.parse('https://kuche7.devcom.live/api/file_types'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         _fileTypes = (data['data'] as List)
//             .map((item) => Data.fromJson(item))
//             .toList();
//         _error = null;
//       } else {
//         _error = 'Failed to load file types: ${response.statusCode}';
//       }
//     } catch (e) {
//       _error = 'Failed to load file types: ${e.toString()}';
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

