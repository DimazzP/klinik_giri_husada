import 'package:flutter/cupertino.dart';

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

  void btRegister(BuildContext context, String nama, String ktp, String nowa,
      String alamat, String sandi, String konfirm) {
    final OkDialog okDialog;

    if (sandi != konfirm) {
      okDialog = new OkDialog(context, 'Konfirmasi Kata Sandi',
          'Konfirmasi kata sandi yang anda masukkan tidak sesuai.');
    } else if (_isChecked == false) {
      okDialog = new OkDialog(context, 'Centang Persetujuan',
          'Klik centang jika anda menyetujui peraturan pada aplikasi ini.');
    } else {
      PatientModel.registerPasien(nama, ktp, nowa, sandi).then((value) {
        if (value.kode == 1) {
          Navigator.pushNamed(context, '/bottom_view');
        } else {
          OkDialog(context, "Error",
              "Gagal mendaftarkan akun anda. Mohon pastikan bahwa data yang anda masukkan benar dan koneksi internet anda lancar.");
        }
      });
    }
  }
}
