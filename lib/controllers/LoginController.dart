import 'dart:convert';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/views/home.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
// import '../helpers/DeviceInfo.dart';
import '../models/UserModel.dart';
import '../helpers/OkDialog.dart';
import '../models/PatientModel.dart';

class LoginController {
  bool _obscure = true;
  

  get getObscure => this._obscure;

  set setObscure(value) => this._obscure = value;

  void toglePass() {
    _obscure = !_obscure;
  }

  void btLogin(BuildContext context, String nowa, String sandi) async {
    // Navigator.pushReplacementNamed(context, '/home');

    // String device_name = await DeviceInfo.getInfo(context);
    UserModel.login(nowa, sandi, 'android').then((value) async {
      if (value.status! >= 400) {
        new OkDialog(context, value.title.toString(), value.message.toString());
      } else {
        final storage = new FlutterSecureStorage();
        String jsonString = json.encode(value.data!.toJson());
        await storage.write(key: 'userdata', value: jsonString);
        Navigator.pushNamed(context, '/home');
        // showdialog();
        AnimatedSnackBar.rectangle(
          'Berhasil Login!', 
          'Selamat datang di Aplikasi Klinik Giri Husada', 
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
          duration: const Duration(seconds: 4),
        ).show(context);
      }
    });
  }

  // void showdialog(BuildContext context) {
  //   showDialog(
  //     context: context, 
  //     builder: builder);
  // }

  void btRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
    // Navigator.pushReplacement(context, '/')
  }
}
