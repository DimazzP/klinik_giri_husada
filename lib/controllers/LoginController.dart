import 'package:flutter/material.dart';
import '../helpers/OkDialog.dart';
import '../models/PatientModel.dart';

class LoginController {
  bool _obscure = true;
  get getObscure => this._obscure;

  set setObscure(value) => this._obscure = value;

  void toglePass() {
    _obscure = !_obscure;
  }

  void btLogin(BuildContext context, String nowa, String sandi) {
    Navigator.pushNamed(context, '/bottom_view');
    PatientModel.loginPasien(nowa, sandi).then((value) {
      if (value.kode == 1) {
        Navigator.pushNamed(context, '/bottom_view');
      } else {
        final myDialog;
        myDialog = new OkDialog(context, 'Gagal Masuk', value.pesan.toString());
      }
    });
  }
}
