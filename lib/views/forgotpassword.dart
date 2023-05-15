import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:whatsapp/whatsapp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // int randomnumber = 10000;
  // final OTPController controllerotp = new OTPController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tnomorhp = TextEditingController();
  
  // WhatsApp wa = WhatsApp();
  // final String text = _tnomorhp.toString();

  int randomnumber = 100000;

  @override
  void initState() {
    _random();
    super.initState();
  }

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
      await prefs.setString("user_nowa", _tnomorhp.text);

    var data = {
      "kodeOtp": randomnumber.toString(),
      "user_nowa": _tnomorhp.text,
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
          "Lupa Kata Sandi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   child: Image.asset(
                    //     "assets/images/notelp.png",
                    //   ),
                    // ),
                    Image.asset(
                      "assets/images/phone1.png",
                      height: 120,
                      width: 120,
                    ),
                  ],
                ),
                Container(
                  margin:  const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: const Center(
                    child: Text(
                      "Masukkan telepon terlebih dahulu untuk melakukan verifikasi OTP",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    showCursor: false, 
                    controller: _tnomorhp,
                    keyboardType: TextInputType.phone,
                    // validator
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        AnimatedSnackBar.material(
                          'Gagal Melakukan Verifikasi',
                          type: AnimatedSnackBarType.error, 
                          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter, 
                          ).show(context);
                      } else if (value.toString().isNotEmpty) {
                        // _sendOtp();
                        Navigator.of(context).pushNamed('/verif');
                        AnimatedSnackBar.material(
                          'Kode OTP Berhasil Dikirim',
                          type: AnimatedSnackBarType.success, 
                          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                          // duration:  
                          ).show(context);
                          _sendOtp();
                          
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13),
                    ],
                    decoration: InputDecoration(
                      hintText: "Nomor Telepon",
                      filled: true,
                      fillColor: Color.fromARGB(255, 218, 218, 218),
                                                                                                                         border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // _sendOtp();
                        // controllerotp.btSaveOTP(context, kode2.text);

                      } else {
                        
                      }
                    },
                    // onPressed: () async {
                    //   final whatsapp = _tnomorhp;
                      
                    // },
                    
                      // if (_formKey.currentState!.validate()) {
                        
                      // }
                    
                    // onPressed: () async => await launch(
                    //   "https://wa.me/6281333793691?text=Hello"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                    child: Text(
                      "Kirim",
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
      )
    );
  }
//   openwhatsapp() async{
//   final whatsapp = _tnomorhp;
//   var whatsappURl_android = "whatsapp://send?phone="+$whatsapp+"&text=hello";
//   var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
//   if(Platform.isIOS){
//     // for iOS phone only
//     if( await canLaunch(whatappURL_ios)){
//        await launch(whatappURL_ios, forceSafariVC: false);
//     }else{
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: new Text("whatsapp no installed")));

//     }

//   }else{
//     // android , web
//     if( await canLaunch(whatsappURl_android)){
//       await launch(whatsappURl_android);
//     }else{
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: new Text("whatsapp no installed")));

//     }


//   }

// }
}
