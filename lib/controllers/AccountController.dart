import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelProfile {
  final String code;
  final String pasien_gender;
  final String pasien_nama;
  final String pasien_nik;
  final String pasien_nowa;
  final String pasien_alamat;

  ModelProfile(
      {required this.code,
      required this.pasien_gender,
      required this.pasien_nama,
      required this.pasien_nik,
      required this.pasien_nowa,
      required this.pasien_alamat});

  factory ModelProfile.fromJson(Map<String, dynamic> json) {
    return ModelProfile(
        code: json['code'],
        pasien_gender: json['data']['pasien_gender'],
        pasien_nama: json['data']['pasien_nama'],
        pasien_nik: json['data']['pasien_nik'],
        pasien_nowa: json['data']['user_nowa'],
        pasien_alamat: json['data']['pasien_alamat']);
  }

  static Future<ModelProfile> getData({String? pasiend_id}) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.21:8000/api/daftar/getprofile'),
        body: {'pasien_id': pasiend_id});
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print("data: ${jsonResponse}");
      return ModelProfile.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
