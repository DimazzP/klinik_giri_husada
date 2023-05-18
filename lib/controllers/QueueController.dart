import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';

import '../widgets/AwesomeDialogWidget.dart';

class QueueController {
  // static void btCheckHour(
  //     BuildContext context, String tanggal, String idjenis) async {}

  static void btRegist(BuildContext context, String tanggal, String status,
      String idpasien, String idjenis, String nomor_antrian) async {
    if (nomor_antrian == '17') {
      AwesomeWidget.errorDialog(context, 'Melebihi Batas',
          'Layanan online pada tanggal tersebut melebihi batas. Anda sudah tidak bisa lagi mendaftar.');
    } else {
      DaftarModel.tambahDaftar(tanggal, status, idpasien, idjenis)
          .then((value) {
        if (value.status! >= 400) {
          AwesomeWidget.errorDialog(context, value.title!, value.message!);
        } else {
          Navigator.pushReplacementNamed(context, '/register_queue',
              arguments: value.data![0]);
          // new OkDialog(context, value.title!, value.message!);
        }
      });
    }
  }

  static void batalkan(BuildContext context, String idDaftar) async {
    AwesomeWidget.infoDialog(context, 'Batalkan Pesanan',
        'Nomor antrian anda akan dihapus jika anda membatalkan pendaftaran anda.',
        () {
      DaftarModel.batalkan(context, idDaftar).then((value) {
        if (value.status! >= 400) {
          AwesomeWidget.errorDialog(context, value.title!, value.message!);
        } else {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, '/success_cancel');
        }
      });
    });
  }
}
