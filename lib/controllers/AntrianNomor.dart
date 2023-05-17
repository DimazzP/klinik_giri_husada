import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelAntrian {
  final String code;
  final String daftar_tanggal;
  final String pasien_nama;
  final String daftar_nomor;
  final String daftar_status;
  final String jenis_layanan;
  final String pekerja_nama;

  ModelAntrian(
      {required this.code,
      required this.daftar_tanggal,
      required this.pasien_nama,
      required this.daftar_nomor,
      required this.daftar_status,
      required this.jenis_layanan,
      required this.pekerja_nama});

  factory ModelAntrian.fromJson(Map<String, dynamic> json) {
    return ModelAntrian(
        code: json['code'],
        daftar_tanggal: json['data']['daftar_tanggal'],
        pasien_nama: json['data']['pasien_nama'],
        daftar_nomor: json['data']['daftar_nomor'].toString(),
        daftar_status: json['data']['daftar_status'],
        jenis_layanan: json['data']['jenis_layanan'],
        pekerja_nama: json['data']['pekerja_nama']);
  }

  static Future<ModelAntrian> getData(
      {String? daftar_nomor, String? daftar_tanggal}) async {
    var response = await http.post(
        Uri.parse('http://172.16.103.211:8000/api/daftar/getnomor'),
        body: {'daftar_nomor': daftar_nomor, 'daftar_tanggal': daftar_tanggal});
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print("data: ${jsonResponse}");
      return ModelAntrian.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
