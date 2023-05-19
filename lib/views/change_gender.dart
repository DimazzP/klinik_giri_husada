import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

import '../models/ModelToken.dart';
import '../models/UserModel.dart';
import '../widgets/AwesomeDialogWidget.dart';

class ChangeGender extends StatefulWidget {
  const ChangeGender({super.key});

  @override
  State<ChangeGender> createState() => _ChangeGenderState();
}

class _ChangeGenderState extends State<ChangeGender> {
  var _formKey = GlobalKey<FormState>();
  int? selectedIndex;
  String? gender;
  bool? _passwordVisible;
  TextEditingController password = TextEditingController();
  Widget _customSelect(String nameGender, int index) {
    Icon? iconName;
    Color? changeColor;
    String? changeGender;
    selectedIndex == index
        ? changeColor = AppColors.primary
        : changeColor = AppColors.grey;
    if (nameGender == 'L') {
      changeGender = 'Laki-laki';
      iconName = Icon(
        Icons.man,
        color: changeColor,
        size: 80.sp,
      );
    } else {
      changeGender = 'Perempuan';
      iconName = Icon(
        Icons.woman,
        color: changeColor,
        size: 80.sp,
      );
    }

    return InkWell(
        // style: TextButton.styleFrom(backgroundColor: AppColors.grey3),
        onTap: () {
          setState(() {
            selectedIndex = index;
            gender = nameGender;
          });
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Center(
            child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 20.h),
            iconName,
            SizedBox(height: 10.h),
            TextHelper(
              textAlign: TextAlign.center,
              text: '$changeGender',
              fontSize: 18.sp,
              fontFamily: FontFamily.bold,
              fontColor: changeColor,
            ),
            SizedBox(height: 20.h),
          ],
        )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      gender = ModalRoute.of(context)!.settings.arguments as String;
      setState(() {
        gender == 'L' ? selectedIndex = 0 : selectedIndex = 1;
      });
    });
  }

  void showCustomSnackbarContent(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        padding: EdgeInsets.all(16),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Berhasil',
          message: 'Data jenis kelamin anda berhasil diubah.',
          contentType: ContentType.success,
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Ubah Data Jenis Kelamin',
                  style:
                      TextStyle(fontFamily: FontFamily.bold, fontSize: 18.sp),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xfff1f1f1),
          automaticallyImplyLeading: false),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            alignment: Alignment.topCenter,
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h),
                child: TextHelper(
                  text: 'Pilih Jenis Kelamin',
                  fontSize: 20.sp,
                  fontColor: AppColors.black,
                  fontFamily: FontFamily.bold,
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.w),
                      child: _customSelect('L', 0),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 18.w),
                      child: _customSelect('P', 1),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h),
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
                height: 90.h,
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
                                    _passwordVisible = !_passwordVisible!;
                                  });
                                },
                                icon: Icon(_passwordVisible!
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                color: Color.fromARGB(255, 143, 143, 143),
                              ),
                              suffixIconColor: Colors.black,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.w, 13.h, 10.w, 7.h),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300)),
                            ),
                            obscureText: _passwordVisible!,
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserResponse data = await ModelToken.getUserData();
                      AwesomeWidget.infoDialog(context, 'Ubah Profil Anda',
                          'Apakah anda yakin untuk mengubah data akun anda? Klik OK untuk jika setuju.',
                          () {
                        UserModel.ubahData(
                                context,
                                data.user_id.toString(),
                                password.text.toString(),
                                '3',
                                gender.toString())
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
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: TextHelper(
                      text: 'Simpan',
                      fontSize: 18.sp,
                      fontColor: Colors.white,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      )),
    );
  }
}
