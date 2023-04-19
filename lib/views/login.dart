import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    final myAppbar = AppBar(
      elevation: 0,
      backgroundColor: Color(0xfff1f1f1),
      title: Container(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logodinas.png"),
            Container(
              margin: EdgeInsets.only(left: 6, right: 6),
              child: Text(
                "Klinik Giri Husada",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Image.asset("assets/images/logopuskesmas.png"),
          ],
        ),
      ),
    );

    final heighMedia =
        MediaQuery.of(context).size.height - myAppbar.preferredSize.height;
    final int paddingMedia = 12;

    // double height = appBar.preferredSize.height;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff1f1f1),
      appBar: myAppbar,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: heighMedia * 0.13,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffd9d9d9),
                    ),
                    child: AutoSizeText(
                      "Aplikasi Pendaftaran Pasien\nKlinik Giri Husada",
                      style: Theme.of(context).textTheme.displayMedium,
                      // style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: heighMedia * 0.21,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/ilustrasi.png",
                  ),
                ),
                Container(
                  height: heighMedia * 0.02,
                ),
                Container(
                    height: heighMedia * 0.29,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: tNowa,
                            style: TextStyle(fontSize: 14),
                            // showCursor: false,
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
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Icon(Icons.phone)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: TextFormField(
                            obscureText: controller.getObscure,
                            style: TextStyle(fontSize: 14),
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
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
                      ],
                    )),
                Container(
                  height: heighMedia * 0.1,
                  alignment: Alignment.center,
                  child: Container(
                    height: 44,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.btLogin(
                                context, tNowa.text, tSandi.text);
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        child: AutoSizeText(
                          "Masuk",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: heighMedia * 0.05,
                  child: Center(
                      child: Text(
                    "Lupa Kata Sandi?",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  )),
                ),
                Container(
                  height: heighMedia * 0.05,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Belum Punya Akun? ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pushNamed('/register');
                            });
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
