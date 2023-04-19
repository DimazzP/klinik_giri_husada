import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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

  final RegisterController controller = new RegisterController();

  @override
  Widget build(BuildContext context) {
    var bodysmall = Theme.of(context).textTheme.bodySmall;
    var bodymedium = Theme.of(context).textTheme.bodySmall;
    var headmedium = Theme.of(context).textTheme.headlineMedium;
    var headlarge = Theme.of(context).textTheme.headlineLarge;
    final heighMedia = MediaQuery.of(context).size.height;
    final widthMedia = MediaQuery.of(context).size.width;
    final int paddingMedia = 12;

    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Pelayanan", style: headlarge),
        backgroundColor: Color(0xfff1f1f1),
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  //c1
                  Container(
                    alignment: Alignment.center,
                    height: heighMedia * 0.11,
                    child: TextFormField(
                      style: headmedium,
                      controller: tName,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Masukkan Nama Lengkap Anda";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Nama Lengkap",
                      ),
                    ),
                  ),
                  //c2
                  Container(
                    alignment: Alignment.center,
                    height: heighMedia * 0.11,
                    child: TextFormField(
                      style: headmedium,
                      controller: tNik,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Masukkan NIK KTP Anda";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Nomor KTP",
                      ),
                    ),
                  ),
                  //c3s
                  Container(
                    alignment: Alignment.center,
                    height: heighMedia * 0.11,
                    child: TextFormField(
                      style: headmedium,
                      controller: tNo,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Masukkan Nomor Whatsapp Anda";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Nomor Whatsapp",
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(13),
                      ],
                    ),
                  ),
                  //c4
                  Container(
                    alignment: Alignment.center,
                    height: heighMedia * 0.11,
                    child: TextFormField(
                      style: headmedium,
                      controller: tAlamat,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Masukkan Alamat Anda";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Alamat",
                      ),
                    ),
                  ),
                  //c5
                  Container(
                    alignment: Alignment.center,
                    height: heighMedia * 0.11,
                    child: TextFormField(
                      style: headmedium,
                      controller: tSandi,
                      obscureText: controller.obscure1,
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
                    alignment: Alignment.center,
                    height: heighMedia * 0.11,
                    child: TextFormField(
                      style: headmedium,
                      controller: tKonfirm,
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
                    alignment: Alignment.center,
                    height: heighMedia * 0.08,
                    child: CheckboxListTile(
                        title: Text(
                          "Dengan ini saya menyetujui Persyaratan pada aplikasi ini",
                          style: Theme.of(context).textTheme.labelSmall,
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
                  //c8
                  Container(
                    alignment: Alignment.center,
                    height: heighMedia * 0.13,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              controller.btRegister(
                                  context,
                                  tName.text,
                                  tNik.text,
                                  tNo.text,
                                  tAlamat.text,
                                  tSandi.text,
                                  tKonfirm.text);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(double.infinity, double.minPositive),
                            padding: EdgeInsets.all(8)),
                        child: Text(
                          "Daftar",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
