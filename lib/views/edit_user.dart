import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/controllers/UserController.dart';
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

bool _passwordVisible = true;
@override
void initState() {
  _passwordVisible = true;
}

class _EditUser extends State<EditUser> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController cValue = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? isNumber;
  ModelEdit? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isNumber = false;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      model = ModalRoute.of(context)!.settings.arguments as ModelEdit;
      setState(() {
        cValue.text = model!.myvalue.toString();
      });
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/account');
        return true;
      },
      child: Scaffold(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Align(
                      alignment: FractionalOffset.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: TextHelper(
                          text: 'Ubah ${model?.valueCategory}',
                          fontSize: 14.sp,
                          fontColor: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.2)),
                            child: isNumber == true
                                ? TextFormField(
                                    controller: cValue,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(16)
                                    ],
                                    validator: (value) {
                                      if (value == null ||
                                          value.toString().isEmpty) {
                                        return '${model?.valueCategory} tidak boleh kosong';
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: TextHelper(
                          text: "Password",
                          fontSize: 16.sp,
                          fontColor: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                            controller: password,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return '${model?.valueCategory} tidak boleh kosong';
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
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300)),
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
                            UserController.btUbah(
                                context,
                                data.user_id.toString(),
                                password.text.toString(),
                                model!.idcategory.toString(),
                                cValue.text.toString());
                          }
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
      ),
    );
  }
}
