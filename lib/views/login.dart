import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../helpers/colorThemes.dart';
import '../helpers/FontSize.dart';
import '../widgets/TextHelper.dart';
import '../widgets/TextResponsive.dart';

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
    final heighMedia = MediaQuery.of(context).size.height;
    final int paddingMedia = 12;
    var headmedium = Theme.of(context).textTheme.displayMedium;
    final FittedFont fittedFont = new FittedFont(context);
    final inColor = AppColors();

    String _deviceName = '';

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff1f1f1),
      body: Form(
        key: _formKey,
        child: Container(
          margin: MediaQuery.of(context).padding,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: heighMedia * 0.15,
                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffd9d9d9),
                      ),
                      child: TextHelper(
                        text: "Aplikasi Pendaftaran Pasien\nKlinik Giri Husada",
                        fontSize: fittedFont.small,
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  height: heighMedia * 0.025,
                ),
                Container(
                  height: heighMedia * 0.2,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/ilustrasi.png",
                  ),
                ),
                SizedBox(
                  height: heighMedia * 0.015,
                ),
                Container(
                    height: heighMedia * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: tNowa,
                            style: TextStyle(fontSize: fittedFont.small),
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
                            style: TextStyle(fontSize: fittedFont.medium),
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
                  height: heighMedia * 0.11,
                  alignment: Alignment.center,
                  child: Container(
                    height: heighMedia * 0.07,
                    constraints: BoxConstraints(maxHeight: 60),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.btLogin(context, tNowa.text, tSandi.text);
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                      child: TextHelper(
                        text: "Masuk",
                        fontSize: fittedFont.medium,
                        fontFamily: 'nunito-b',
                        fontColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: heighMedia * 0.05,
                  child: Center(
                      child: TextHelper(
                    text: "Lupa Kata Sandi?",
                    fontSize: fittedFont.extraSmall,
                    fontColor: inColor.cgrey,
                  )),
                ),
                Container(
                  height: heighMedia * 0.05,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextHelper(
                          text: "Belum punya akun?",
                          fontSize: fittedFont.small,
                          fontFamily: 'nunito-b',
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
                            child: TextHelper(
                              text: " Daftar",
                              fontFamily: 'nunito-b',
                              fontSize: fittedFont.small,
                              textDecoration: TextDecoration.underline,
                            )
                            //  Text(
                            //   "Daftar",
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     color: Theme.of(context).colorScheme.primary,
                            //   ),
                            // ),
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
