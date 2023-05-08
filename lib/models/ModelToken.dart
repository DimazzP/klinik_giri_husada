import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ModelToken {
  static Future<Map<String, String>> getToken() async {
    final storage = new FlutterSecureStorage();
    String? jsonString = await storage.read(key: 'token');
    return {
      'Authorization': 'Bearer $jsonString',
    };
  }
}
