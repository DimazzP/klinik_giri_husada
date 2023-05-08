import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/models/ModelToken.dart';

class LayananModel {
  final int? status;
  final String? title;
  final String? message;
  LayananResponse? data;
  AntrianResponse? antrian;

  LayananModel(
      {this.status, this.title, this.message, this.data, this.antrian});

  factory LayananModel.fromJson(Map<String, dynamic> json) {
    var myAntrian;
    json['antrian'] != null
        ? myAntrian = AntrianResponse.fromJson(json['antrian'])
        : myAntrian = null;
    return LayananModel(
      status: json['status'],
      title: json['title'],
      message: json['message'],
      data: LayananResponse.fromJson(json['data']),
      antrian: myAntrian,
    );
  }
  static Future<LayananModel> getJenis(String id_jenis, String date) async {
    Uri url = Uri.parse(Apihelper.url + 'layanan/' + id_jenis + '/' + date);
    var response = await http.get(url, headers: await ModelToken.getToken());
    var jenisData = json.decode(response.body);
    return LayananModel.fromJson(jenisData);
  }
}

class LayananResponse {
  final int? jenis_id;
  final String? jenis_layanan;
  final String? pekerja_nama;

  const LayananResponse({
    this.jenis_id,
    this.jenis_layanan,
    this.pekerja_nama,
  });
  factory LayananResponse.fromJson(Map<String, dynamic> json) {
    return LayananResponse(
      jenis_id: json['jenis_id'],
      jenis_layanan: json['jenis_layanan'],
      pekerja_nama: json['pekerja_nama'],
    );
  }
}

class AntrianResponse {
  final int? daftar_nomor;
  const AntrianResponse({this.daftar_nomor});
  factory AntrianResponse.fromJson(Map<String, dynamic> json) {
    return AntrianResponse(daftar_nomor: json['daftar_nomor']);
  }
}
