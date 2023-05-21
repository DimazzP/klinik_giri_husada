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

class EditUser extends StatefulWidget {
  @override
  State<EditUser> createState() => _EditUser();
}

// bool _passwordVisible = true;
// @override
// void initState() {
//   _passwordVisible = true;
// }

class _EditUser extends State<EditUser> {
  var _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  TextEditingController cValue = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? isNumber;
  bool? isName;
  ModelEdit? model;

  void showCustomSnackbarContent(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        padding: EdgeInsets.all(16),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Berhasil',
          message: '${model!.valueCategory.toString()} telah diubah)',
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
    isName = false;
    _passwordVisible = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      model = ModalRoute.of(context)!.settings.arguments as ModelEdit;
      setState(() {
        if (model!.idcategory == 1) {
          isName = true;
        }
        if (model!.idcategory == 2) {
          isNumber = true;
        }
        cValue.text = model!.myvalue.toString();
      });
    });
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Text(
                  'Ubah ${model?.valueCategory}',
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
                        text: 'Ubah ${model?.valueCategory}',
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
                          child: isNumber == true
                              ? TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: cValue,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16)
                                  ],
                                  validator: (value) {
                                    if (value == null ||
                                        value.toString().isEmpty) {
                                      return '${model?.valueCategory} tidak boleh kosong';
                                    } else if (value.toString().length < 16) {
                                      return 'Jumlah NIK minimal 16 karakter';
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.w, 13.h, 10.w, 7.h),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300)),
                                  ),
                                )
                              : TextFormField(
                                  controller: cValue,
                                  validator: (value) {
                                    if (value == null ||
                                        value.toString().isEmpty) {
                                      return '${model?.valueCategory} tidak boleh kosong';
                                    }
                                  },
                                  inputFormatters: isName == true
                                      ? <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[a-zA-Z\s]')),
                                        ]
                                      : null,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.w, 13.h, 10.w, 7.h),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300)),
                                  ),
                                ),
                        ),
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
                      text: "Password",
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
                                  return 'Password tidak boleh kosong';
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                hintText: 'Masukkan Password Anda',
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
                            UserModel.ubahData(
                                    context,
                                    data.user_id.toString(),
                                    password.text.toString(),
                                    model!.idcategory.toString(),
                                    cValue.text)
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
