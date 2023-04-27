import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/helpers/DeviceInfo.dart';
import 'package:klinik_giri_husada/models/UserModel.dart';
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
    String device_name = await DeviceInfo.getInfo(context);
    UserModel.login(nowa, sandi, device_name).then((value) {
      // new OkDialog(context, value.status.toString(), value.message.toString());

      if (value.status! > 399) {
        new OkDialog(context, value.title.toString(), value.message.toString());
      } else {
        Navigator.pushNamed(context, '/bottom_view');
      }
    });
  }
}
