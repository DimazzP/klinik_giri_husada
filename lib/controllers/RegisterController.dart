import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/models/UserModel.dart';

import '../helpers/OkDialog.dart';
import '../models/PatientModel.dart';

class RegisterController {
  bool _isChecked = false;
  String? test;
  bool obscure1 = true;
  bool obscure2 = true;

  get isChecked => this._isChecked;

  set isChecked(value) => this._isChecked = value;

  get getObscure1 => this.obscure1;

  get getObscure2 => this.obscure2;

  void toglePass1() {
    obscure1 = !obscure1;
  }

  void toglePass2() {
    obscure2 = !obscure2;
  }

  void btRegister(
    BuildContext context,
    String nowa,
    String sandi,
    String nama,
    String nik,
    String gender,
    String alamat,
    String konfirm,
  ) {
    // String device_name = await DeviceInfo.getInfo(context);
    if (sandi.toString().length < 8) {
      new OkDialog(context, "Kata Sandi Terlalu Pendek",
          "Masukkan kata sandi paling sedikit 8 karakter.");
    } else if (sandi != konfirm) {
      new OkDialog(context, 'Konfirmasi Kata Sandi',
          'Konfirmasi kata sandi yang anda masukkan tidak sesuai.');
    } else if (_isChecked == false) {
      new OkDialog(context, 'Centang Persetujuan',
          'Klik centang jika anda menyetujui peraturan pada aplikasi ini.');
    } else {
      UserModel.register(nowa, sandi, 'mobile', nama, nik, gender, alamat)
          .then((value) async {
        if (value.status! >= 400) {
          OkDialog(context, value.title.toString(), value.message.toString());
        } else {
          final storage = new FlutterSecureStorage();
          String jsonString = json.encode(value.data!.toJson());
          await storage.write(key: 'userdata', value: jsonString);
          await storage.write(key: 'token', value: value.token);
          Navigator.pushReplacementNamed(context, '/home');
        }
      });
    }
  }
}
