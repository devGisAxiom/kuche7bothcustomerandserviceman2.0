import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => FileTypesProvider(
//         apiService: FileTypesApiService(),
//       ),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Types Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FileTypesScreen(),
//     );
//   }
// }

// Model Classes
class FileType {
  String? status;
  int? errorCode;
  String? message;
  List<Data>? data;

  FileType({this.status, this.errorCode, this.message, this.data});

  FileType.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error_code'] = errorCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;

  Data({this.id, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

// API Service
class FileTypesApiService {
  final String baseUrl;

  FileTypesApiService({this.baseUrl = 'https://pms.gisaxiom.com/api'});

  Future<List<Data>> fetchFileTypes(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/file_types'),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List).map((item) => Data.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load file types: ${response.statusCode}');
    }
  }
}

// Provider
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

// Main Screen
// class FileTypesScreen extends StatefulWidget {
//   const FileTypesScreen({Key? key}) : super(key: key);

//   @override
//   State<FileTypesScreen> createState() => _FileTypesScreenState();
// }

// class _FileTypesScreenState extends State<FileTypesScreen> {
//   Data? _selectedFileType;
//   final String token =
//       "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2t1Y2hlNy5kZXZjb20ubGl2ZS9hcGkvbG9naW4iLCJpYXQiOjE3NDI5OTM0MTgsImV4cCI6MTc0Mjk5NzAxOCwibmJmIjoxNzQyOTkzNDE4LCJqdGkiOiJ1UjcyZ1hHcDZ4TkMwdlVtIiwic3ViIjoiMjYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.YSiErxDPtL0rS6xPbYGCmWCGkdX3ivbOpn2vCT-ufbk"; // Replace with your actual token

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<FileTypesProvider>(context, listen: false)
//           .fetchFileTypes(token);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('File Types Dropdown')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Select a file type:', style: TextStyle(fontSize: 16)),
//             const SizedBox(height: 10),
//             _buildFileTypeDropdown(),
//             const SizedBox(height: 20),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<FileTypesProvider>(context, listen: false)
//               .fetchFileTypes(token);
//         },
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }

//   Widget _buildFileTypeDropdown() {
//     final fileTypesProvider = Provider.of<FileTypesProvider>(context);

//     if (fileTypesProvider.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (fileTypesProvider.error != null) {
//       return Text(
//         'Error: ${fileTypesProvider.error}',
//         style: const TextStyle(color: Colors.red),
//       );
//     }

//     if (fileTypesProvider.fileTypes.isEmpty) {
//       return const Text('No file types available');
//     }

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: DropdownButton<Data>(
//         value: _selectedFileType,
//         hint: const Text('Select File Type'),
//         isExpanded: true,
//         underline: const SizedBox(),
//         items: fileTypesProvider.fileTypes.map((Data fileType) {
//           return DropdownMenuItem<Data>(
//             value: fileType,
//             child: Text(fileType.name ?? ''),
//           );
//         }).toList(),
//         onChanged: (Data? newValue) {
//           setState(() {
//             _selectedFileType = newValue;
//           });
//         },
//       ),
//     );
//   }
// }

// Row(
//                 children: [
//                   const Text('File Type:'),
//                   const SizedBox(width: 10),
//                   DropdownButton<String>(
//                     value: selectedFile,
//                     items: file.map((String type) {
//                       return DropdownMenuItem<String>(
//                         value: type,
//                         child: Text(type),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedFile = newValue!;
//                       });
//                     },
//                   ),
//                 ],
//               ),
