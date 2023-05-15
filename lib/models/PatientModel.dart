import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/ApiHelper.dart';

class PatientModel {
  int? kode;
  String? pesan;
  List<DataPatient>? data;

  

  PatientModel({this.kode, this.pesan, this.data});

  static Future<PatientModel> registerPasien(String pasien_nama,
      String pasien_nik, String pasien_nowa, String pasien_sandi) async {
    Uri url = Uri.parse(Apihelper.url + 'register_pasien.php');
    var response = await http.post(url, body: {
      "pasien_nama": pasien_nama,
      "pasien_nik": pasien_nik,
      "pasien_nowa": pasien_nowa,
      "pasien_sandi": pasien_sandi
    });

    var body = json.decode(response.body);
    return PatientModel(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }

  static Future<PatientModel> loginPasien(String nowa, String sandi) async {
    Uri url = Uri.parse(Apihelper.url + 'login_pasien.php');
    var response = await http.post(url, body: {
      'pasien_nowa': nowa,
      'pasien_sandi': sandi,
    });

    var body = json.decode(response.body);
    return PatientModel(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    List<DataPatient> data = [];
    data = json["data"]
        .map<DataPatient>((json) => DataPatient.fromJson(json))
        .toList();

    return PatientModel(
      kode: json['kode'],
      pesan: json['pesan'],
      data: data,
    );
  }

  static Future<PatientModel> tampil() async {
    // Uri url = Uri.parse('http://172.17.201.61:8000/users');
    Uri url = Uri.parse(Apihelper.url + 'history.php');

    var hasil = await http.get(url);
    var datab = json.decode(hasil.body);
    return PatientModel.fromJson(datab);

    // print(datab['data']);
    // return PatientModel(
    //   kode: datab['kode'],
    //   pesan: datab['pesan'],
    //   data: datab.tojson['data'],
    // );
  }
}

class DataPatient {
  final String? pasien_id;
  final String? pasien_nama;
  final String? pasien_nik;
  final String? pasien_nowa;
  final String? pasien_sandi;
  const DataPatient(
      {this.pasien_id,
      this.pasien_nama,
      this.pasien_nik,
      this.pasien_nowa,
      this.pasien_sandi});

  factory DataPatient.fromJson(Map<String, dynamic> json) {
    return DataPatient(
      pasien_id: json['pasien_id'],
      pasien_nama: json['pasien_nama'],
      pasien_nik: json['pasien_nik'],
      pasien_nowa: json['pasien_nowa'],
      pasien_sandi: json['pasien_sandi'],
    );
  }
}

void main() {
  // PatientModel.tampil();
  PatientModel.tampil().then((value) {
    print(value.kode.toString());
    print(value.pesan);
    // print(value.data![0].toString());
    print(value.data![0].pasien_id);
  });
}
