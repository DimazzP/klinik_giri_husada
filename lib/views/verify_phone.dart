import 'dart:convert';
import 'dart:math';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/ModelOtp.dart';
import 'package:klinik_giri_husada/models/ModelPostRegister.dart';
import 'package:klinik_giri_husada/widgets/AppbarWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../models/UserModel.dart';
import '../widgets/AwesomeDialogWidget.dart';

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

  bool? checkVerifikasi;
  ModelPostRegister? model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkVerifikasi = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      randomString = generateRandomString();
      model = ModalRoute.of(context)!.settings.arguments as ModelPostRegister;
      setState(() {
        ModelOtp.sendOtp(
            context, model!.nowa.toString(), randomString.toString());
        setState(() {
          checkVerifikasi = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ModelPostRegister model =
        ModalRoute.of(context)!.settings.arguments as ModelPostRegister;
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppbarWidget(
        context: context,
        titleText: 'Verifikasi OTP',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  margin: EdgeInsets.only(top: 30.h),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Container(
                        // margin:  EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
                        height: 130.h,
                        width: 130.w,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, left: 15.w, right: 15.w),
                          child: PinCodeTextField(
                            keyboardType: TextInputType.number,
                            controller: otp,
                            appContext: context,
                            validator: (value2) {
                              if (value2.toString().isEmpty) {
                                return 'Kode OTP tidak boleh kosong';
                              }
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
                                    Color.fromARGB(255, 63, 187, 192),
                                selectedFillColor: Colors.white,
                                borderWidth: 1.5),
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(
                                fontFamily: 'nunito-r', fontSize: 18.sp),
                            // backgroundColor: Colors.grey.shade100,
                            enableActiveFill: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                checkVerifikasi = true;
                              });
                              randomString = generateRandomString();
                              ModelOtp.sendOtp(
                                  context, model.nowa, randomString.toString());
                              setState(() {
                                checkVerifikasi = false;
                              });
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
                                if (kode == randomString) {
                                  UserModel.register(
                                          context,
                                          model.nowa,
                                          model.sandi,
                                          'mobile',
                                          model.nama,
                                          model.nik,
                                          model.gender,
                                          model.alamat)
                                      .then((value) async {
                                    if (value.status! >= 400) {
                                      AwesomeWidget.errorDialog(
                                          context,
                                          value.title.toString(),
                                          value.message.toString());
                                    } else {
                                      final storage =
                                          new FlutterSecureStorage();
                                      String jsonString =
                                          json.encode(value.data!.toJson());
                                      await storage.write(
                                          key: 'userdata', value: jsonString);
                                      await storage.write(
                                          key: 'token', value: value.token);
                                      await storage.write(
                                          key: 'logstatus', value: 'true');
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              '/home', (route) => false);
                                      AnimatedSnackBar.rectangle(
                                        'Akun Berhasil Dibuat',
                                        'Akun anda telah terdaftar pada layanan kami',
                                        type: AnimatedSnackBarType.success,
                                        brightness: Brightness.light,
                                      ).show(context);
                                    }
                                  });
                                } else {
                                  AwesomeWidget.errorDialog(
                                      context,
                                      'Kode Verifikasi Salah',
                                      'Pastikan kode verifikasi yang anda masukkan sudah sesuai dengan yang anda terima.');
                                }
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
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
          ),
          Visibility(
              visible: checkVerifikasi!,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.grey.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )),
        ],
      ),
    );
  }
}
