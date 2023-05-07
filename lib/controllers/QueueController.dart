import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';

class QueueController {
  static void btRegist(BuildContext context, String tanggal, String status,
      String idpasien, String idjenis, String nomor_antrian) async {
    DaftarModel.tambahDaftar(tanggal, status, idpasien, idjenis, nomor_antrian)
        .then((value) {
      if (value.status! >= 400) {
        new OkDialog(context, value.title!, value.message!);
      } else {
        new OkDialog(context, value.title!, value.message!);
      }
    });
  }
}
