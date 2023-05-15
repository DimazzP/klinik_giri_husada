import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import '../helpers/colorThemes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> 
  createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        // width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_test.jpg"),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
      alignment: Alignment.topLeft,
      child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 50),
              child: TextHelper(
                    text: "Selamat Datang\ndi Aplikasi\nKlinik Giri Husada",
                    fontSize: 30.sp,
                    fontFamily: 'kgp-2',
                    fontColor: AppColors.primary,
                ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20.h),
              child: TextHelper(
                text: "Silahkan menikmati fasilitas yang kami sediakan pada aplikasi ini", 
                fontSize: 12.sp,
                fontFamily: 'kgp-2',
                fontColor: AppColors.primary,
                ),
              // child: T(
              //   "Silahkan menikmati fasilitas yang kami sediakan pada aplikasi ini",
              //   style: TextStyle(
              //     fontSize: 12,
              //     fontFamily: 'kgp-2'
              //   ),
              // ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              // alignment: Alignment.(-1, 0),
              height: 60.h,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.grey,
                  )
                ],
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}