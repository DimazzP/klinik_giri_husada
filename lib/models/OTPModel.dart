import 'dart:convert';
import '../helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

class OTPModel {
  int? status;
  String? title;
  String? message;
  OTPResponse? data;
  String? token;

  OTPModel({this.status, this.title, this.message, this.data , this.token});
  
  factory OTPModel.fromJson(Map<String, dynamic> json) {
    var myData = null;
    if (json['data'] != null) {
      myData = OTPResponse.fromJson(json['data']);
    }

    return OTPModel(
      status: json['status'],
      title: json['title'],
      message: json['message'],
      data: myData,
      token: json['token'] as String?,
    );
  }
  static Future<OTPModel> save(String kode2) async {
    Uri url = Uri.parse(Apihelper.url + 'auth/simpanotp');
    var response = await http.post(url, body: {
      'otp': kode2,
    });
    var userData = json.decode(response.body);
    return OTPModel.fromJson(userData);
  }
}

class OTPResponse {
  final int? id;
  final String? nomor;
  final int? otp;
  final int? waktu;
  final OTPResponse? OTP;

  const OTPResponse({this.id, this.nomor, this.otp, this.waktu, this.OTP});

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      id: json['id'],
      nomor: json['nomor'],
      otp: json['otp'],
      waktu: json['waktu'],
      OTP: OTPResponse.fromJson(json['OTP'],)
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomor': nomor,
      'otp': otp,
      'waktu': waktu,
      'OTP': OTP
    };
  }
}









// import 'dart:convert';
// import '../helpers/ApiHelper.dart';
// import 'package:http/http.dart' as http;

//   import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class OTPModel extends StatefulWidget {
//   OTPModel({Key? key}) : super(key: key);

//   @override
//   _OTPModelState createState() => _OTPModelState();
// }

// class _OTPModelState extends State<OTPModel> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _phoneController = TextEditingController();

  

//   void _sendOtp() async {
//     String phone = _phoneController.text;
//     final response = await http.post(
//       Uri.parse('https://api.fonnte.com/send'),
//       headers: {
//         'Authorization': 'YOUR_API_KEY_HERE',
//       },
//       body: {
//         'target': phone,
//         'message': 'Your OTP code is 123456',
//       },
//     );
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('OTP sent successfully!'),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to send OTP.'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Send OTP'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter phone number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a valid phone number';
//                   }
//                   return null;
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _sendOtp();
//                     }
//                   },
//                   child: Text('Send OTP'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
