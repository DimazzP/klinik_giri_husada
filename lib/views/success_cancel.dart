import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

class SuccessCancel extends StatelessWidget {
  const SuccessCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
          return true;
        },
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cancelled.png',
                width: 120.w,
                height: 120.h,
              ),
              SizedBox(height: 60.h),
              TextHelper(text: 'Pesanan Telah Dibatalkan', fontSize: 20.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: TextHelper(
                  text:
                      'Pesanan anda telah dibatalkan dan nomor antrian yang diterima akan ditarik kembali.',
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                  fontColor: AppColors.grey,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/home', (route) => false);
                    },
                    child: TextHelper(
                      text: 'Kembali',
                      fontSize: 18.sp,
                      fontColor: Colors.white,
                    )),
              )
            ],
          )),
        ));
  }
}
