import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/ModelEdit.dart';
import 'package:klinik_giri_husada/widgets/AppbarWidget.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

import '../helpers/FontFamily.dart';
import '../models/ResetPasswordModel.dart';

class ResetInputPassword extends StatefulWidget {
  const ResetInputPassword({super.key});

  @override
  State<ResetInputPassword> createState() => _ResetInputPasswordState();
}

class _ResetInputPasswordState extends State<ResetInputPassword> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController tSandi = TextEditingController();
  TextEditingController tKonfirm = TextEditingController();
  bool? obscure1;
  bool? obscure2;
  ModelEdit? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscure1 = true;
    obscure2 = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      model = ModalRoute.of(context)!.settings.arguments as ModelEdit;
      print(model!.valueCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(height: 20.h),
                Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/reset-pass.png',
                      width: 120.w,
                      height: 120.h,
                    )),
                SizedBox(height: 16.h),
                TextHelper(
                  text: 'Kata Sandi Baru',
                  textAlign: TextAlign.center,
                  fontSize: 22.sp,
                  fontFamily: FontFamily.bold,
                ),
                TextHelper(
                  text:
                      'Masukkan kata sandi baru untuk mengubah kata sandi anda',
                  textAlign: TextAlign.center,
                  fontSize: 18.sp,
                  fontColor: AppColors.grey,
                  fontFamily: FontFamily.semibold,
                ),
                SizedBox(height: 20.h),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.topLeft,
                    child: TextHelper(
                      text: 'Kata Sandi',
                      fontSize: 16.sp,
                    )),
                SizedBox(height: 6.h),
                Container(
                  // height: 12.h,
                  child: TextFormField(
                    controller: tSandi,
                    obscureText: obscure1!,
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: FontFamily.semibold,
                        fontSize: 17.sp),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Masukkan Kata Sandi";
                      } else if (value.toString().length < 8) {
                        return 'Kata sandi minimal 8 huruf';
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.grey3,
                        hintText: 'Minimal 8 huruf',
                        suffixIcon: GestureDetector(
                          child: obscure1!
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              obscure1 = !obscure1!;
                            });
                          },
                        )),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.topLeft,
                    child: TextHelper(
                      text: 'Konfirmasi Kata Sandi',
                      fontSize: 16.sp,
                    )),
                SizedBox(height: 6.h),
                Container(
                  // height: 12.h,
                  child: TextFormField(
                    controller: tKonfirm,
                    obscureText: obscure2!,
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: FontFamily.semibold,
                        fontSize: 17.sp),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Masukkan Kata Sandi";
                      } else if (value.toString().length < 8) {
                        return 'Kata sandi minimal 8 huruf';
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.grey3,
                        hintText: 'Konfirmasi kata sandi',
                        suffixIcon: GestureDetector(
                          child: obscure2!
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              obscure2 = !obscure2!;
                            });
                          },
                        )),
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('ini nomor' + model!.myvalue.toString());
                            ;
                            if (tSandi!.text != tKonfirm.text) {
                              AwesomeWidget.errorDialog(
                                  context,
                                  'Konfirmasi Tidak Sama',
                                  'Pastikan konfirmasi kata sandi anda sudah benar');
                            } else {
                              AwesomeWidget.infoDialog(
                                  context,
                                  'Ubah Kata Sandi',
                                  'Apakah anda yakin untuk mengubah kata sandi nomor anda?',
                                  () {
                                Navigator.pop(context);
                                ResetPasswordModel.ubahPassword(
                                        context,
                                        model!.myvalue.toString(),
                                        tSandi.text.toString(),
                                        model!.valueCategory.toString())
                                    .then((value) {
                                  if (value.status == 200) {
                                    AnimatedSnackBar.rectangle(
                                      'Berhasil Mengubah Kata Sandi',
                                      'Kata sandi anda telah berhasil untuk diubah.',
                                      type: AnimatedSnackBarType.success,
                                      brightness: Brightness.light,
                                    ).show(context);
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/login', (route) => false);
                                  }
                                });
                              });
                            }
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: TextHelper(
                            text: 'Ubah Kata Sandi',
                            fontSize: 18.sp,
                            fontColor: Colors.white,
                          ),
                        ))),
              ]),
            )),
      )),
    );
  }
}
