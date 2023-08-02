import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/AwesomeDialogWidget.dart';

class ModelOtp {
  static sendOtp(
      BuildContext context, String nomoHp, String randomNumber) async {
    try {
      var token = "KjcLD3YVTox9Zqx#Lzmh";
      var url = 'https://api.fonnte.com/send';

      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": token,
        },
        body: {
          'target': nomoHp,
          'message': "Kode Verifikasi Anda adalah $randomNumber",
        },
      );
      var jsonResponse = json.decode(response.body);
      return jsonResponse;
    } catch (e) {
      AwesomeWidget.errorDialog(context, 'Terjadi Kesalahan',
          'Mohon maaf, proses yang Anda lakukan gagal. Mohon untuk mengulang proses tersebut atau tunggu sejenak untuk mencoba kembali.');
      throw Exception('error saya $e');
    }
  }
}
