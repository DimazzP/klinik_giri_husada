// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:animated_snack_bar/animated_snack_bar.dart';

// import '../models/OTPModel.dart';

// class OTPController {
  
//   void btSaveOTP(BuildContext context,String kode2) async {
    
//     OTPModel.save(kode2).then((value) async {
//       if (value.status! >= 400) {
//         AnimatedSnackBar.material(
//         'Gagal Melakukan Verifikasi',
//         type: AnimatedSnackBarType.error, 
//         desktopSnackBarPosition: DesktopSnackBarPosition.topCenter, 
//         ).show(context);
//       } else {
//         String jsonString = jsonEncode(value.data!.toJson());
//         Navigator.pushNamed(context, 'verif');
//         AnimatedSnackBar.material(
//         'Kode OTP Berhasil Dikirim',
//         type: AnimatedSnackBarType.success, 
//         desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
//         ).show(context);
//       }
//     });
//   }
// }