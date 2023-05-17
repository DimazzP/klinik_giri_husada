import 'dart:convert';

import 'package:http/http.dart' as http;

class Update {
  String? code;
  String? message;

  Update({this.code, this.message});

  static Future<Update> ubahnama(
      {String? idUser, String? namaBaru, String? chekPassowrd}) async {
    Uri url = Uri.parse("http://172.16.103.211:8000/api/daftar/verifdata");
    var HasilResponse = await http.post(url, body: {
      "user_idpasien": idUser,
      "pasien_nama": namaBaru,
      "password": chekPassowrd,
    });
    var data = json.decode(HasilResponse.body);
    return Update(code: data['kode'], message: data['status']);
  }

  static Future<Update> ubahnik(
      {String? idUser, String? nikBaru, String? chekPassowrd}) async {
    Uri url = Uri.parse("http://172.16.103.211:8000/api/daftar/nikupdate");
    var HasilResponse = await http.post(url, body: {
      "user_idpasien": idUser,
      "pasien_nik": nikBaru,
      "password": chekPassowrd,
    });
    var data = json.decode(HasilResponse.body);
    return Update(code: data['kode'], message: data['status']);
  }

  static Future<Update> ubahnomor(
      {String? idUser, String? nomorBaru, String? chekPassowrd}) async {
    Uri url = Uri.parse("http://172.16.103.211:8000/api/daftar/nomorupdate");
    var HasilResponse = await http.post(url, body: {
      "user_idpasien": idUser,
      "user_nowa": nomorBaru,
      "password": chekPassowrd,
    });
    var data = json.decode(HasilResponse.body);
    return Update(code: data['kode'], message: data['status']);
  }

  static Future<Update> ubahalamat(
      {String? idUser, String? alamatBaru, String? chekPassowrd}) async {
    Uri url = Uri.parse("http://172.16.103.211:8000/api/daftar/alamatupdate");
    var HasilResponse = await http.post(url, body: {
      "user_idpasien": idUser,
      "pasien_alamat": alamatBaru,
      "password": chekPassowrd,
    });
    var data = json.decode(HasilResponse.body);
    return Update(code: data['kode'], message: data['status']);
  }
}
