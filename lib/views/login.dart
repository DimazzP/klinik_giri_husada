import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/FontFamily.dart';
import '../helpers/colorThemes.dart';
import '../widgets/TextHelper.dart';

import '../controllers/LoginController.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController controller = new LoginController();

  var _formKey = GlobalKey<FormState>();
  TextEditingController tNowa = TextEditingController();
  TextEditingController tSandi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _deviceName = '';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfff1f1f1),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              //! header
              Container(
                height: 161.h,
                width: 375.w,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.r),
                            bottomRight: Radius.circular(40.r)),
                        child: Container(
                          color: Colors.white,
                          height: 137.h,
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 40.h),
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      child: TextHelper(
                        text: "Klinik Giri Husada",
                        fontSize: 28.sp,
                        fontFamily: FontFamily.bold,
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Container(
                              width: 257.h,
                              height: 61.h,
                              alignment: Alignment.center,
                              color: AppColors.grey2,
                              child: TextHelper(
                                text: "Aplikasi Pendaftaran Pasien\nOnline",
                                fontSize: 16.sp,
                                fontFamily: FontFamily.bold,
                                textAlign: TextAlign.center,
                                fontColor: AppColors.black,
                              ),
                            ))),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                height: 150.h,
                child: Image.asset(
                  "assets/images/ilustrasi.png",
                ),
              ),
              SizedBox(height: 25.h),
              //! input field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: TextFormField(
                  controller: tNowa,
                  style: TextStyle(fontSize: 18.sp, color: AppColors.black),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Masukkan Nomor Anda";
                    }
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(13),
                  ],
                  decoration: InputDecoration(
                      hintText: "Nomor Telepon",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 16.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(Icons.phone)),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: TextFormField(
                  obscureText: controller.getObscure,
                  style: TextStyle(fontSize: 18.sp, color: AppColors.black),
                  // showCursor: false,
                  controller: tSandi,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Masukkan Kata Sandi";
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Kata Sandi",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.toglePass();
                        });
                      },
                      child: controller.getObscure
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              //! button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.btLogin(context, tNowa.text, tSandi.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.sp),
                      child: TextHelper(
                        text: "Masuk",
                        fontSize: 20.sp,
                        fontFamily: FontFamily.semibold,
                        fontColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/verify_phone');
                  },
                  child: TextHelper(
                    text: "Lupa Kata Sandi?",
                    fontSize: 16.sp,
                    fontFamily: FontFamily.medium,
                    fontColor: AppColors.grey,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 16.h),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Belum Punya Akun? ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontFamily: FontFamily.medium,
                          fontSize: 18.sp)),
                  TextSpan(
                      text: "Daftar",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.btRegister(context);
                        },
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.primary,
                        fontFamily: FontFamily.bold,
                        decoration: TextDecoration.underline,
                      ))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
