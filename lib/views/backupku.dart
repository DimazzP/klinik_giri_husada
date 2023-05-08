//   body: Container(
//     margin: EdgeInsets.all(14),
//     child: SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             alignment: Alignment.topLeft,
//             margin: EdgeInsets.symmetric(vertical: 14),
//             child: Text("Silahkan Pilih Layanan",
//                 style: TextStyle(
//                   color: incolor.cblack,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 )),
//           ),
//           GridView(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 14,
//               mainAxisSpacing: 8,
//               childAspectRatio: 3 / 3.1,
//             ),
//             children: [
//               MenuWidget(
//                   onClick: () {
//                     Navigator.of(context).pushNamed("/queue");
//                   },
//                   textButton: 'Pelayanan Gawat Darurat',
//                   imageButton: 'assets/images/heart.png'),
//               MenuWidget(
//                   onClick: () {
//                     Navigator.of(context).pushNamed("/queue");
//                   },
//                   textButton: 'Pelayanan Balita Sakit',
//                   imageButton: 'assets/images/balita.png'),
//               MenuWidget(
//                   onClick: () {
//                     Navigator.of(context).pushNamed("/queue");
//                   },
//                   textButton: 'Pelayanan TBC',
//                   imageButton: 'assets/images/tbc.png'),
//               MenuWidget(
//                   onClick: () {
//                     Navigator.of(context).pushNamed("/queue");
//                   },
//                   textButton: 'Konsultasi Gizi',
//                   imageButton: 'assets/images/gizi.png'),
//               MenuWidget(
//                   onClick: () {
//                     Navigator.of(context).pushNamed("/queue");
//                   },
//                   textButton: 'Pelayanan Imunisasi',
//                   imageButton: 'assets/images/imunisasi.png'),
//               MenuWidget(
//                   onClick: () {
//                     Navigator.of(context).pushNamed("/queue");
//                   },
//                   textButton: 'Pelayanan Gigi dan Mulut',
//                   imageButton: 'assets/images/gigi.png'),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),

//! texttheme main.dart
//  theme: ThemeData(
//   fontFamily: "nunito-r",
//   primaryColor: Color(0xff3FBBC0),
//   primarySwatch: Palette.pcolor,
//   textTheme: TextTheme(
//     headlineSmall: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 12,
//       fontFamily: "nunito-b",
//       // fontWeight: FontWeight.w600,
//     ),
//     headlineMedium: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 14,
//       fontFamily: "nunito-b",
//       // fontWeight: FontWeight.w600,
//     ),
//     headlineLarge: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 18,
//       fontFamily: "nunito-b",
//       // fontWeight: FontWeight.w600,
//     ),
//     bodySmall: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 12,
//       fontFamily: "nunito-r",
//     ),
//     bodyMedium: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 14,
//       fontFamily: "nunito-r",
//     ),
//     bodyLarge: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 18,
//       fontFamily: "nunito-r",
//     ),
//     displaySmall: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 12,
//       fontFamily: "nunito-m",
//     ),
//     displayMedium: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 14,
//       fontFamily: "nunito-m",
//     ),
//     displayLarge: const TextStyle(
//       color: Color(0xff282828),
//       fontSize: 18,
//       fontFamily: "nunito-m",
//     ),
//     labelSmall: const TextStyle(
//       color: Color(0xff5f5f5f),
//       fontSize: 12,
//       fontFamily: "nunito-m",
//       letterSpacing: 1,
//       wordSpacing: 0,
//     ),
//     labelMedium: const TextStyle(
//       color: Color(0xff5f5f5f),
//       fontSize: 14,
//       fontFamily: "nunito-m",
//     ),
//     labelLarge: const TextStyle(
//       color: Color(0xff5f5f5f),
//       fontSize: 18,
//       fontFamily: "nunito-m",
//     ),
//     titleLarge: const TextStyle(
//       color: Color(0xffffffff),
//       fontSize: 20,
//       fontFamily: "nunito-b",
//     ),
//   ),
// ),

//! login
//       import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import '../helpers/colorThemes.dart';
// import '../helpers/FontSize.dart';
// import '../widgets/TextHelper.dart';

// import '../controllers/LoginController.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final LoginController controller = new LoginController();

//   var _formKey = GlobalKey<FormState>();
//   TextEditingController tNowa = TextEditingController();
//   TextEditingController tSandi = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final heighMedia = MediaQuery.of(context).size.height;
//     final int paddingMedia = 12;
//     var headmedium = Theme.of(context).textTheme.displayMedium;
//     final FittedFont fittedFont = new FittedFont(context);

//     String _deviceName = '';

//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xfff1f1f1),
//       body: Form(
//         key: _formKey,
//         child: Container(
//           margin: MediaQuery.of(context).padding,
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   height: heighMedia * 0.15,
//                   child: Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color(0xffd9d9d9),
//                       ),
//                       child: TextHelper(
//                         text: "Aplikasi Pendaftaran Pasien\nKlinik Giri Husada",
//                         fontSize: fittedFont.small,
//                         textAlign: TextAlign.center,
//                       )),
//                 ),
//                 SizedBox(
//                   height: heighMedia * 0.025,
//                 ),
//                 Container(
//                   height: heighMedia * 0.2,
//                   alignment: Alignment.center,
//                   child: Image.asset(
//                     "assets/images/ilustrasi.png",
//                   ),
//                 ),
//                 SizedBox(
//                   height: heighMedia * 0.015,
//                 ),
//                 Container(
//                     height: heighMedia * 0.3,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           child: TextFormField(
//                             controller: tNowa,
//                             style: TextStyle(fontSize: fittedFont.small),
//                             // showCursor: false,
//                             validator: (value) {
//                               if (value.toString().isEmpty) {
//                                 return "Masukkan Nomor Anda";
//                               }
//                             },
//                             keyboardType: TextInputType.phone,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly,
//                               LengthLimitingTextInputFormatter(13),
//                             ],
//                             decoration: InputDecoration(
//                                 hintText: "Nomor Telepon",
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 suffixIcon: Icon(Icons.phone)),
//                           ),
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           child: TextFormField(
//                             obscureText: controller.getObscure,
//                             style: TextStyle(fontSize: fittedFont.medium),
//                             // showCursor: false,
//                             controller: tSandi,
//                             validator: (value) {
//                               if (value.toString().isEmpty) {
//                                 return "Masukkan Kata Sandi";
//                               }
//                             },
//                             decoration: InputDecoration(
//                               fillColor: Colors.white,
//                               filled: true,
//                               hintText: "Kata Sandi",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14),
//                                   borderSide: BorderSide.none),
//                               suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     controller.toglePass();
//                                   });
//                                 },
//                                 child: controller.getObscure
//                                     ? const Icon(
//                                         Icons.visibility_off,
//                                       )
//                                     : const Icon(
//                                         Icons.visibility,
//                                       ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//                 Container(
//                   height: heighMedia * 0.11,
//                   alignment: Alignment.center,
//                   child: Container(
//                     height: heighMedia * 0.07,
//                     constraints: BoxConstraints(maxHeight: 60),
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           controller.btLogin(context, tNowa.text, tSandi.text);
//                         }
//                       },
//                       style: ButtonStyle(
//                           shape:
//                               MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ))),
//                       child: TextHelper(
//                         text: "Masuk",
//                         fontSize: fittedFont.medium,
//                         fontFamily: 'nunito-b',
//                         fontColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   height: heighMedia * 0.05,
//                   child: Center(
//                       child: TextHelper(
//                     text: "Lupa Kata Sandi?",
//                     fontSize: fittedFont.extraSmall,
//                     fontColor: AppColors.grey,
//                   )),
//                 ),
//                 Container(
//                   height: heighMedia * 0.05,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         TextHelper(
//                           text: "Belum punya akun?",
//                           fontSize: fittedFont.small,
//                           fontFamily: 'nunito-b',
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 Navigator.of(context).pushNamed('/register');
//                               });
//                             },
//                             style: TextButton.styleFrom(
//                                 padding: EdgeInsets.zero,
//                                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                 alignment: Alignment.centerLeft),
//                             child: TextHelper(
//                               text: " Daftar",
//                               fontFamily: 'nunito-b',
//                               fontSize: fittedFont.small,
//                               textDecoration: TextDecoration.underline,
//                             )
//                             //  Text(
//                             //   "Daftar",
//                             //   style: TextStyle(
//                             //     fontWeight: FontWeight.bold,
//                             //     color: Theme.of(context).colorScheme.primary,
//                             //   ),
//                             // ),
//                             )
//                       ]),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//! inputfieldform
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:klinik_giri_husada/helpers/FontFamily.dart';
// import 'package:klinik_giri_husada/helpers/colorThemes.dart';

// class InputFieldForm extends StatefulWidget {
  // const InputFieldForm({super.key});
//   InputFieldForm({
//     required this.ctrl,
//     required this.error,
//     required this.placeholder,
//     this.inputFormatter,
//     Key? key,
//   }) : super(key: key);
//   final TextEditingController ctrl;
//   final String error;
//   final String placeholder;
//   final List<TextInputFormatter>? inputFormatter;

//   @override
//   State<InputFieldForm> createState() => _InputFieldFormState();
// }

// class _InputFieldFormState extends State<InputFieldForm> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.ctrl,
//       validator: (value) {
//         if (value.toString().isEmpty) {
//           return widget.error;
//         }
//       },
//       style: TextStyle(
//           color: AppColors.black,
//           fontFamily: FontFamily.semibold,
//           fontSize: 16.sp),
//       decoration: InputDecoration(labelText: widget.placeholder),
//       inputFormatters: widget.inputFormatter,
//       // widget.inputFormatter != null ? [widget.inputFormatter!] : null,
//     );
//   }
// }
