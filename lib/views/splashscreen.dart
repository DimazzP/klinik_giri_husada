import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../helpers/colorThemes.dart';
import '../widgets/TextResponsive.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = new AppColors();
    final widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 250),
              child: Image.asset(
                "assets/images/logo.png",
                width: widthMedia * 0.6,
              ),
            ),
            FittedText(
              text: "Aplikasi Pendaftaran Pasien",
              fontSize: 0.06,
              fontFamily: 'nunito-b',
            ),
            FittedText(
              text: "Daftarkan diri anda dengan mudah",
              fontSize: 0.04,
              fontFamily: 'nunito-b',
              fontColor: appColors.cgrey,
            ),
          ],
        ),
      ),
    );
  }
}
