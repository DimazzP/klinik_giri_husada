import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:klinik_giri_husada/controllers/LoginController.dart';
import 'package:klinik_giri_husada/controllers/ResetPasswordController.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/widgets/AppbarWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
// import 'package:whatsapp/whatsapp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tnomorhp = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1F1F1),
        appBar: AppbarWidget(context: context, titleText: 'Lupa Kata Sandi'),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/whatsapp.png",
                        height: 86.h,
                        width: 86.w,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40.h),
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Center(
                        child: TextHelper(
                      text:
                          'Masukkan nomor whatsapp anda untuk menerima verifikasi OTP',
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                      fontColor: AppColors.grey,
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontFamily.bold,
                      ),
                      showCursor: false,
                      controller: _tnomorhp,
                      keyboardType: TextInputType.phone,
                      // validator
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          AnimatedSnackBar.material(
                            'Gagal Melakukan Verifikasi',
                            type: AnimatedSnackBarType.error,
                            desktopSnackBarPosition:
                                DesktopSnackBarPosition.topCenter,
                          ).show(context);
                        }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(13),
                      ],

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        // suffixIcon: Icon(Icons.phone),
                        hintText: "Nomor Whatsapp",
                        filled: true,
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 15.w, right: 15.w),
                    margin: EdgeInsets.only(top: 20.h),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ResetPasswordController.lihatNomor(
                              context, _tnomorhp.text);
                        } else {}
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ))),
                      child: Text(
                        "Kirim",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
