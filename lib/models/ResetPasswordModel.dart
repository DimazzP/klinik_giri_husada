import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:klinik_giri_husada/helpers/ApiHelper.dart';
import 'package:klinik_giri_husada/models/ModelToken.dart';

import '../widgets/AwesomeDialogWidget.dart';

class ResetPasswordModel {
  final int? status;
  final String? title;
  final String? message;
  final String? token;
  const ResetPasswordModel({this.status, this.title, this.message, this.token});

  static Map<String, String> getToken(String token) {
    return {
      'Authorization': 'Bearer 1|3fonVUzITkFo1sdnWpkXAux5Don6LGYf8V2xZiD6',
    };
  }

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    String? token = null;
    if (json['token'] != null) {
      token = json['token'];
    }
    return ResetPasswordModel(
      status: json['status'],
      title: json['title'],
      message: json['message'],
      token: token,
    );
  }

  static Future<ResetPasswordModel> ubahPassword(
      BuildContext context, String nowa, String password, String token) async {
    // try {
    Uri url = Uri.parse(Apihelper.url + 'reset/password/nomor/ubah');
    var response = await http
        .post(url, headers: ResetPasswordModel.getToken(token), body: {
      'user_nowa': nowa,
      'password': password,
    });
    var data = json.decode(response.body);
    return ResetPasswordModel.fromJson(data);
    // } catch (e) {
    //   AwesomeWidget.errorDialog(context, 'Terjadi Kesalahan',
    //       'Mohon maaf, proses yang Anda lakukan gagal. Mohon untuk mengulang proses tersebut atau tunggu sejenak untuk mencoba kembali.');
    //   throw Exception('error saya $e');
    // }
  }

  static Future<ResetPasswordModel> checkNomor(
      BuildContext context, String nowa) async {
    try {
      Uri url = Uri.parse(Apihelper.url + 'reset/password/nomor');
      var response = await http.post(url, body: {
        'user_nowa': nowa,
      });
      var data = json.decode(response.body);
      return ResetPasswordModel.fromJson(data);
    } catch (e) {
      AwesomeWidget.errorDialog(context, 'Terjadi Kesalahan',
          'Mohon maaf, proses yang Anda lakukan gagal. Mohon untuk mengulang proses tersebut atau tunggu sejenak untuk mencoba kembali.');
      throw Exception('error saya $e');
    }
  }
}
