import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../views/forgotpassword.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});
  

  @override
  State<Verification> createState() => _VerificationState();
}

  
  String currentText = '';
  String nowa = '';
  int kode = 0;
  String nowa2 = '';

  

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpcontroller = TextEditingController();
  

  @override
  void initState() {
    super.initState();
    _getData();
    _random();
  }

  void _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nowa = prefs.getString("nowa") ?? '';
      kode = prefs.getInt("kodeOtp") ?? 0;
      nowa2 = prefs.getString("nowa") ?? '';
    });
  }

  int randomnumber = 10000;

  void _random() {
    setState(() {
      Random random =  Random();
      randomnumber = random.nextInt(90000) + 10000;
      // LengthLimitingTextInputFormatter(6);
    });
  }
  
  void _sendOtp() async {
    var url = Uri.parse(
        'http://172.16.110.137/apiklinik/otp.php'); // Ganti dengan URL endpoint API yang sesuai

    SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt("kodeOtp", randomnumber);
      await prefs.setString("user_nowa", "$nowa2");

    var data = {
      "kodeOtp": randomnumber.toString(),
      "user_nowa": nowa2,
    };
    final response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print('Respon dari server: $responseData');
    } else {
      print('Gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Verifikasi OTP",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const Center(
                      child: Text(
                        "Masukkan Kode OTP yang sudah dikirimkan",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: const Text("ke nomor anda"),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/otp1.png",
                height: 110,
                width: 110,
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                            alignment: FractionalOffset.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16, left: 15, right: 15),
                              child: PinCodeTextField(
                                controller: otpcontroller,
                                appContext: context,
                                length: 5, // panjang kode OTP
                                onChanged: (value) {
                                  debugPrint(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                cursorColor: Colors.black,
                                animationType: AnimationType.fade,  
                                // onCompleted: (code) {
                                //   if (otpcontroller == kode) {
                                //     print('berhasil');
                                //   } else if (otpcontroller != kode) {
                                //     print('gagal');
                                //   }
                                // },
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(8),
                                    fieldHeight: 56,
                                    fieldWidth: 56,
                                    activeFillColor: Colors.white,
                                    inactiveFillColor: Colors.grey.shade100,
                                    activeColor: Colors.grey.shade300,
                                    inactiveColor: Colors.grey.shade300,
                                    selectedColor: const Color.fromARGB(255, 63, 187, 192),
                                    selectedFillColor: Colors.white,
                                    borderWidth: 1.5),
                                animationDuration: const Duration(milliseconds: 300),
                                textStyle: const TextStyle(fontFamily: 'nunito-r', fontSize: 18),
                                // backgroundColor: Colors.grey.shade100,
                                enableActiveFill: true,
                              ),
                            ),
                          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // padding: EdgeInsets.only(top: 10),
                    child: const Text(
                      "Belum menerima kode?",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(top: 10),
                    child: TextButton(
                      // style: sty,
                      onPressed: () {
                        _sendOtp();
                      },
                      child: const Text(
                        "Kirim Ulang",
                        style: TextStyle(
                            color: Colors.black, 
                            fontWeight: FontWeight.bold,
                            fontFamily: ('nunito-b')),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    if (currentText == kode.toString()) {
                      Navigator.of(context).pushNamed('/changepw');
                      AnimatedSnackBar.material(
                          'Kode OTP Sesuai',
                          type: AnimatedSnackBarType.success, 
                          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter, 
                          ).show(context);
                    } else if (currentText == '') {
                      AnimatedSnackBar.material(
                          'Pin Tidak Boleh Kosong',
                          type: AnimatedSnackBarType.error, 
                          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter, 
                          ).show(context);
                    } else if (currentText != kode.toString()) {
                      AnimatedSnackBar.material(
                          'Kode OTP Tidak Sesuai',
                          type: AnimatedSnackBarType.error, 
                          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter, 
                          ).show(context);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
                  child: const Text(
                    "Verifikasi",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

