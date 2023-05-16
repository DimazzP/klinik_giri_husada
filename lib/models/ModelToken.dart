import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/models/UserModel.dart';

class ModelToken {
  static Future<Map<String, String>> getToken() async {
    final storage = new FlutterSecureStorage();
    String? jsonString = await storage.read(key: 'token');
    return {
      'Authorization': 'Bearer $jsonString',
    };
  }

  static Future<UserResponse> getUserData() async {
    final storage = new FlutterSecureStorage();
    String? jsonString = await storage.read(key: 'userdata');
    UserResponse myObject = UserResponse.fromJson(json.decode(jsonString!));
    return myObject;
  }
}
