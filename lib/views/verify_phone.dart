import 'dart:math';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/ModelOtp.dart';
import 'package:klinik_giri_husada/models/ModelPostRegister.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  var _formKey = GlobalKey<FormState>();
  String? kode;
  String? randomString;
  TextEditingController otp = TextEditingController();

  String generateRandomString() {
    Random random = Random();
    String result = '';
    String kode;

    for (int i = 0; i < 5; i++) {
      result += random.nextInt(10).toString();
    }
    return result;
  }

  ModelPostRegister? model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      randomString = generateRandomString();
      model = ModalRoute.of(context)!.settings.arguments as ModelPostRegister;
      // setState(() {
      ModelOtp.sendOtp(model!.nowa.toString(), randomString.toString());
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    ModelPostRegister model =
        ModalRoute.of(context)!.settings.arguments as ModelPostRegister;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Verifikasi OTP",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Container(
                  // margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                      child: TextHelper(
                    textAlign: TextAlign.center,
                    text:
                        'Kami sudah mengirimkan kode OTP\nPeriksa whatsapp anda untuk melanjutkan',
                    fontSize: 16.sp,
                  )),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Image.asset(
                  "assets/images/otp.png",
                  height: 130,
                  width: 140,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Align(
                  alignment: FractionalOffset.center,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 16.h, left: 15.w, right: 15.w),
                    child: PinCodeTextField(
                      controller: otp,
                      appContext: context,
                      validator: (value2) {
                        if (value2.toString().isEmpty) {
                          return 'Kode OTP tidak boleh kosong';
                        }
                        // if (value2 == kode.toString()) {
                        //   AnimatedSnackBar.material(
                        //     'Kode OTP Sesuai',
                        //     type: AnimatedSnackBarType.success,
                        //     desktopSnackBarPosition:
                        //         DesktopSnackBarPosition.topCenter,
                        //   ).show(context);
                        // } else if (value2 == '') {
                        //   AnimatedSnackBar.material(
                        //     'Pin Tidak Boleh Kosong',
                        //     type: AnimatedSnackBarType.error,
                        //     desktopSnackBarPosition:
                        //         DesktopSnackBarPosition.topCenter,
                        //   ).show(context);
                        // } else if (value2 != kode.toString()) {
                        //   AnimatedSnackBar.material(
                        //     'Kode OTP Tidak Sesuai',
                        //     type: AnimatedSnackBarType.error,
                        //     desktopSnackBarPosition:
                        //         DesktopSnackBarPosition.topCenter,
                        //   ).show(context);
                        // }
                      },
                      length: 5, // panjang kode OTP
                      onChanged: (value) {
                        // debugPrint(value);
                        setState(() {
                          kode = value;
                        });
                      },
                      cursorColor: Colors.black,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 56,
                          fieldWidth: 56,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.grey.shade100,
                          activeColor: Colors.grey.shade300,
                          inactiveColor: Colors.grey.shade300,
                          selectedColor:
                              const Color.fromARGB(255, 63, 187, 192),
                          selectedFillColor: Colors.white,
                          borderWidth: 1.5),
                      animationDuration: const Duration(milliseconds: 300),
                      textStyle:
                          const TextStyle(fontFamily: 'nunito-r', fontSize: 18),
                      // backgroundColor: Colors.grey.shade100,
                      enableActiveFill: true,
                    ),
                  ),
                ),
                // Container(
                //   child: CheckboxListTile(
                //       title: TextHelper(
                //         text:
                //             'Dengan ini saya menyetujui persyaratan pada aplikasi ini!',
                //         fontSize: 14.sp,
                //       ),
                //       contentPadding: EdgeInsets.zero,
                //       controlAffinity: ListTileControlAffinity.leading,
                //       activeColor: Color(0xff3FBBC0),
                //       value: controller.isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           controller.isChecked = value!;
                //         });
                //       }),
                // ),
                SizedBox(height: 16.h),
                Container(
                  child: TextButton(
                      onPressed: () {
                        randomString = generateRandomString();
                        ModelOtp.sendOtp(model.nowa, randomString.toString());
                        // _sendOtp();
                      },
                      child: TextHelper(
                        text: 'Belum Mendapatkan Kode?',
                        fontSize: 16.sp,
                        fontFamily: FontFamily.bold,
                        fontColor: AppColors.black,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(randomString);
                          print(kode);
                          if (kode == randomString) {
                            print('sama');
                          } else {
                            print('tidak sama');
                          }
                          // controller.btRegister(
                          //     context,
                          //     getnowa.toString(),
                          //     getsandi.toString(),
                          //     getnama.toString(),
                          //     getnik.toString(),
                          //     getgender.toString(),
                          //     getalamat.toString(),
                          //     getkonfirm.toString());
                        } else {}
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                      child: TextHelper(
                        text: "Verifikasi",
                        fontSize: 18.sp,
                        fontColor: Colors.white,
                        fontFamily: FontFamily.bold,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
