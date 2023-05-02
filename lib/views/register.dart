import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/widgets/InputFieldForm.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/RegisterController.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController tName = TextEditingController();
  TextEditingController tNik = TextEditingController();
  TextEditingController tNo = TextEditingController();
  TextEditingController tSandi = TextEditingController();
  TextEditingController tAlamat = TextEditingController();
  TextEditingController tKonfirm = TextEditingController();
  String? _selectedGender = "L";

  final RegisterController controller = new RegisterController();

  @override
  Widget build(BuildContext context) {
    final heightTop = 90.h;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextHelper(text: 'Mendaftarkan Akun', fontSize: 20.sp),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 33.h,
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextHelper(
                                text: 'Buat Akun Anda',
                                fontSize: 20.sp,
                                fontFamily: FontFamily.bold,
                              ),
                              TextHelper(
                                text: 'Isi sesuai data diri asli anda',
                                fontSize: 16.sp,
                                fontColor: AppColors.grey,
                                fontFamily: FontFamily.medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 32.h),
                            height: heightTop,
                            child: InputFieldForm(
                              ctrl: tName,
                              error: 'Nama tidak boleh kosong',
                              placeholder: 'Nama Lengkap',
                            )),
                        //c2
                        Container(
                            height: heightTop,
                            child: InputFieldForm(
                              ctrl: tNik,
                              error: 'NIK tidak boleh kosong',
                              placeholder: 'Nomor KTP',
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                              ],
                            )),
                        //c3s
                        Container(
                            height: heightTop,
                            child: InputFieldForm(
                              ctrl: tNo,
                              error: 'Nomor whatsapp tidak boleh kosong',
                              placeholder: 'Nomor Whatsapp',
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(13),
                              ],
                            )),
                        Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextHelper(
                              text: 'Jenis Kelamin',
                              fontSize: 16.sp,
                              fontColor: AppColors.grey,
                              fontFamily: FontFamily.semibold,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                  title: const Text('Laki-laki'),
                                  value: "L",
                                  groupValue: _selectedGender,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                  title: const Text('Perempuan'),
                                  value: "P",
                                  groupValue: _selectedGender,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ]),
                        // ),
                        Container(
                            height: heightTop,
                            child: InputFieldForm(
                              ctrl: tAlamat,
                              error: 'Alamat tidak boleh kosong',
                              placeholder: 'Alamat',
                            )),
                        //c5
                        Container(
                          height: heightTop,
                          child: TextFormField(
                            controller: tSandi,
                            obscureText: controller.obscure1,
                            style: TextStyle(
                                color: AppColors.black,
                                fontFamily: FontFamily.semibold,
                                fontSize: 16.sp),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Masukkan Kata Sandi";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Kata Sandi",
                                suffixIcon: GestureDetector(
                                  child: controller.obscure1
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    setState(() {
                                      controller.toglePass1();
                                    });
                                  },
                                )),
                          ),
                        ),
                        //c6
                        Container(
                          height: heightTop,
                          child: TextFormField(
                            controller: tKonfirm,
                            style: TextStyle(
                                color: AppColors.black,
                                fontFamily: FontFamily.semibold,
                                fontSize: 16.sp),
                            obscureText: controller.getObscure2,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Masukkan Konfirmasi Kata Sandi";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Konfirmasi Kata Sandi",
                                suffixIcon: GestureDetector(
                                  child: controller.getObscure2
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    setState(() {
                                      controller.toglePass2();
                                    });
                                  },
                                )),
                          ),
                        ),
                        //c7
                        Container(
                          child: CheckboxListTile(
                              title: TextHelper(
                                text:
                                    'Dengan ini saya menyetujui persyaratan pada aplikasi ini!',
                                fontSize: 14.sp,
                              ),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Color(0xff3FBBC0),
                              value: controller.isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  controller.isChecked = value!;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 130.h,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                controller.btRegister(
                                    context,
                                    tNo.text,
                                    tSandi.text,
                                    tName.text,
                                    tNik.text,
                                    _selectedGender.toString(),
                                    tAlamat.text,
                                    tKonfirm.text);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(double.infinity, double.minPositive),
                              padding: EdgeInsets.all(8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: TextHelper(
                              text: "Daftar Akun",
                              fontSize: 20.sp,
                              fontFamily: FontFamily.semibold,
                              fontColor: Colors.white,
                            ),
                          )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
