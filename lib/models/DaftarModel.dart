import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:klinik_giri_husada/models/ModelToken.dart';

class DaftarModel {
  final int? status;
  final String? title;
  final String? message;
  List<DaftarResponse>? data;

  DaftarModel({this.status, this.title, this.message, this.data});

  factory DaftarModel.fromJson(Map<String, dynamic> json) {
    List<DaftarResponse> fillData = [];
    fillData = json['data']
        .map<DaftarResponse>((json) => DaftarResponse.fromJson(json))
        .toList();

    return DaftarModel(
        status: json['status'],
        title: json['title'],
        message: json['message'],
        data: fillData);
  }

  static Future<DaftarModel> tambahDaftar(String tanggal, String status,
      String idpasien, String idjenis, String nomor_antrian) async {
    final Future<Map<String, String>> myToken = ModelToken.getToken();
    Uri url = Uri.parse(Apihelper.url + 'daftar');
    var response =
        await http.post(url, headers: await ModelToken.getToken(), body: {
      'daftar_tanggal': tanggal,
      'daftar_status': status,
      'daftar_idpasien': idpasien,
      'daftar_idjenis': idjenis,
      'daftar_nomor': nomor_antrian
    });

    var body = json.decode(response.body);
    return DaftarModel.fromJson(body);
    // return DaftarModel(
    //   status: body['status'],
    //   title: body['title'],
    //   message: body['message'],
    //   data: DaftarResponse.fromJson(json['data']),
    // );
  }
}

class DaftarResponse {
  final int? daftar_id;
  final String? daftar_tanggal;
  final String? daftar_status;
  final int? daftar_nomor;
  final String? jenis_layanan;
  final String? pekerjaan_nama;
  const DaftarResponse({
    this.daftar_id,
    this.daftar_tanggal,
    this.daftar_status,
    this.daftar_nomor,
    this.jenis_layanan,
    this.pekerjaan_nama,
  });

  factory DaftarResponse.fromJson(Map<String, dynamic> json) {
    return DaftarResponse(
      daftar_id: json['daftar_id'],
      daftar_tanggal: json['daftar_tanggal'],
      daftar_status: json['daftar_status'],
      daftar_nomor: json['daftar_nomor'],
      jenis_layanan: json['jenis_layanan'],
      pekerjaan_nama: json['pekerjaan_nama'],
    );
  }
}
