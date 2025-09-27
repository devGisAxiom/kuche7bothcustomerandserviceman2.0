import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/core/storage/usepreference.dart';
import 'package:flutter_application_1/customer/model/createservicerequest.dart';
import 'package:http/http.dart' as http;

class ServiceRequestApi {
  static Future<CreateServiceRequest?> createService({
    required List<File> images,
    required List<File> audios,
    required List<File> videos,
    required String note,
    required int idProduct,
    required String serviceissue,
  }) async {
    http.StreamedResponse? streamedResponse;

    try {
      String? token = await UserPreferences.getToken();
      if (token == null) {
        print("⚠️ No token found!");
        return null;
      }

      var uri = Uri.parse(
        "https://pms.gisaxiom.com/api/customers/service/create",
      );
      var request = http.MultipartRequest("POST", uri);

      // ✅ Add token
      request.headers['Authorization'] = "Bearer $token";
      request.fields["note"] = note;
      request.fields["id_product"] = idProduct.toString();
      request.fields["service_issue"] = serviceissue; // ✅ Add service issue

      // ✅ Add files with error handling for each file
      for (var img in images) {
        try {
          request.files.add(
            await http.MultipartFile.fromPath("images[]", img.path),
          );
        } catch (e) {
          print("❌ Error adding image ${img.path}: $e");
        }
      }

      for (var aud in audios) {
        try {
          request.files.add(
            await http.MultipartFile.fromPath("audios[]", aud.path),
          );
        } catch (e) {
          print("❌ Error adding audio ${aud.path}: $e");
        }
      }

      for (var vid in videos) {
        try {
          request.files.add(
            await http.MultipartFile.fromPath("videos[]", vid.path),
          );
        } catch (e) {
          print("❌ Error adding video ${vid.path}: $e");
        }
      }

      // ✅ Send request
      streamedResponse = await request.send();
      var responseString = await streamedResponse.stream.bytesToString();
      var jsonData = json.decode(responseString);

      // if (streamedResponse.statusCode == 200) {
      //   print("✅ Service created successfully");
      //   return CreateServiceRequest.fromJson(jsonData);
      // } else {
      //   print("❌ Server error: ${streamedResponse.statusCode}");
      //   print("❌ Response: $responseString");
      //   return CreateServiceRequest.fromJson(jsonData);
      // }
      if (streamedResponse.statusCode == 200) {
        return CreateServiceRequest.fromJson(jsonData);
      } else if (streamedResponse.statusCode == 401) {
        // ❌ Don’t use ScaffoldMessenger here
        throw UnauthorizedException("Session expired");
      } else {
        throw Exception("Server error: ${streamedResponse.statusCode}");
      }
    } catch (e) {
      print("❌ Error: $e");
      if (streamedResponse != null) {
        print(
          "❌ Status code: ${streamedResponse.statusCode} ${streamedResponse.reasonPhrase}",
        );
      }
      return null;
    }
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}
