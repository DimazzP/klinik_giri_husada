import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

class AwesomeWidget {
  static infoDialog(
      BuildContext context, String title, String desc, VoidCallback onClick) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: '$title',
      desc: '$desc',
      btnCancel: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: TextHelper(
          text: 'Batal',
          fontSize: 15.sp,
          fontFamily: FontFamily.semibold,
          fontColor: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Ubah warna latar belakang
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r), // Memberikan radius
          ),
        ),
      ),
      headerAnimationLoop: false,
      btnOk: ElevatedButton(
        onPressed: onClick,
        child: TextHelper(
          text: 'OK',
          fontSize: 14.sp,
          fontFamily: FontFamily.semibold,
          fontColor: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green, // Ubah warna latar belakang
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r), // Memberikan radius
          ),
        ),
      ),
      titleTextStyle: TextStyle(
        fontFamily: FontFamily.semibold,
        fontSize: 20.sp,
        color: AppColors.black,
      ),
      descTextStyle: TextStyle(
        fontFamily: FontFamily.semibold,
        fontSize: 16.sp,
        color: AppColors.grey,
      ),
    ).show();
  }

  static errorDialog(BuildContext context, String title, String desc) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: '$title',
      desc: '$desc',
      headerAnimationLoop: false,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      btnCancel: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: TextHelper(
          text: 'OK',
          fontSize: 15.sp,
          fontFamily: FontFamily.semibold,
          fontColor: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red, // Ubah warna latar belakang
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r), // Memberikan radius
          ),
        ),
      ),
      titleTextStyle: TextStyle(
        fontFamily: FontFamily.semibold,
        fontSize: 20.sp,
        color: AppColors.black,
      ),
      descTextStyle: TextStyle(
        fontFamily: FontFamily.semibold,
        fontSize: 16.sp,
        color: AppColors.grey,
      ),
    ).show();
  }

  static warningDialog(BuildContext context, String title, String desc) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: '$title',
      desc: '$desc',
      headerAnimationLoop: false,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      btnCancel: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: TextHelper(
          text: 'OK',
          fontSize: 15.sp,
          fontFamily: FontFamily.semibold,
          fontColor: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow, // Ubah warna latar belakang
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r), // Memberikan radius
          ),
        ),
      ),
      titleTextStyle: TextStyle(
        fontFamily: FontFamily.semibold,
        fontSize: 20.sp,
        color: AppColors.black,
      ),
      descTextStyle: TextStyle(
        fontFamily: FontFamily.semibold,
        fontSize: 16.sp,
        color: AppColors.grey,
      ),
    ).show();
  }
}
