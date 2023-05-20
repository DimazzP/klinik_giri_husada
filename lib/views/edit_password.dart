import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/ModelEdit.dart';
import 'package:klinik_giri_husada/models/ModelToken.dart';
import 'package:klinik_giri_husada/models/UserModel.dart';
import 'package:klinik_giri_husada/widgets/AppbarWidget.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';

import '../helpers/FontFamily.dart';
import '../widgets/TextHelper.dart';
import 'account.dart';

class EditPassword extends StatefulWidget {
  @override
  State<EditPassword> createState() => _EditPassword();
}

// bool _passwordVisible = true;
// bool _passwordVisible1 = true;
// @override
// void initState() {
//   _passwordVisible = true;
//   _passwordVisible1 = true;
// }

class _EditPassword extends State<EditPassword> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController cValue = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? isNumber;
  bool _passwordVisible = true;
  bool _passwordVisible1 = true;

  void showCustomSnackbarContent(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        padding: EdgeInsets.all(16),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Berhasil',
          message: 'Kata sandi anda berhasil diubah',
          contentType: ContentType.success,
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isNumber = false;
    _passwordVisible = true;
    _passwordVisible1 = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Text(
                  'Ubah Kata Sandi',
                  style:
                      TextStyle(fontFamily: FontFamily.bold, fontSize: 18.sp),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xfff1f1f1),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Align(
                      alignment: FractionalOffset.topLeft,
                      child: TextHelper(
                        text: 'Kata Sandi Baru',
                        fontSize: 14.sp,
                        fontColor: AppColors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                    ),
                    child: Align(
                      alignment: FractionalOffset.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            child: TextFormField(
                              controller: cValue,
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return 'Kata sandi baru tidak boleh kosong';
                                } else if (value.length < 8) {
                                  return 'Kata sandi minimal harus 8 karakter';
                                }
                              },
                              obscureText: _passwordVisible1,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible1 = !_passwordVisible1;
                                    });
                                  },
                                  icon: Icon(_passwordVisible1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  color: Color.fromARGB(255, 143, 143, 143),
                                ),
                                suffixIconColor: Colors.black,
                                hintText: 'Kata Sandi Baru Minimal 8 Karakter',
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.w, 13.h, 10.w, 7.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Align(
                    alignment: FractionalOffset.topLeft,
                    child: TextHelper(
                      text: "Kata Sandi Lama",
                      fontSize: 16.sp,
                      fontColor: AppColors.grey,
                    ),
                  ),
                ),
                Container(
                    height: 80.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Container(
                            height: 80.h,
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            child: TextFormField(
                              controller: password,
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return 'Kata sandi tidak boleh kosong';
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                hintText: 'Masukkan Kata Sandi Lama',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(_passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  color: Color.fromARGB(255, 143, 143, 143),
                                ),
                                suffixIconColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.w, 13.h, 10.w, 7.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                              ),
                              obscureText: _passwordVisible,
                            ),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          UserResponse data = await ModelToken.getUserData();

                          AwesomeWidget.infoDialog(context, 'Ubah Profil Anda',
                              'Apakah anda yakin untuk mengubah data akun anda? Klik OK untuk jika setuju.',
                              () {
                            UserModel.ubahData(context, data.user_id.toString(),
                                    password.text.toString(), '5', cValue.text)
                                .then((value) async {
                              if (value.status! >= 400) {
                                Navigator.pop(context);
                                AwesomeWidget.errorDialog(
                                    context,
                                    value.title.toString(),
                                    value.message.toString());
                              } else {
                                Navigator.pop(context);
                                final storage = new FlutterSecureStorage();
                                String jsonString =
                                    json.encode(value.data!.toJson());
                                await storage.write(
                                    key: 'userdata', value: jsonString);
                                // showCustomSnackbarContent(context);
                                showCustomSnackbarContent(context);
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/account',
                                );
                              }
                            });
                          });
                        }
                        // showCustomSnackbarContent(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: TextHelper(
                      text: 'Simpan',
                      fontSize: 18.sp,
                      fontColor: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
