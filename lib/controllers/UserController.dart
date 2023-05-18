import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/UserModel.dart';
import '../widgets/AwesomeDialogWidget.dart';

class UserController {
  static void btUbah(BuildContext context, String idUser, String sandi,
      String category, String myvalue) async {
    AwesomeWidget.infoDialog(context, 'Ubah Profil Anda',
        'Apakah anda yakin untuk mengubah data akun anda? Klik OK untuk jika setuju.',
        () {
      UserModel.ubahData(context, idUser, sandi, category, myvalue)
          .then((value) async {
        if (value.status! >= 400) {
          Navigator.pop(context);
          AwesomeWidget.errorDialog(
              context, value.title.toString(), value.message.toString());
        } else {
          Navigator.pop(context);
          final storage = new FlutterSecureStorage();
          String jsonString = json.encode(value.data!.toJson());
          await storage.write(key: 'userdata', value: jsonString);
          Navigator.pushReplacementNamed(context, '/account');
        }
      });
    });
  }
}
