import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';

class OkDialog {
  OkDialog(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                title,
                style: TextStyle(
                    fontFamily: FontFamily.semibold,
                    color: AppColors.grey,
                    fontSize: 14.sp),
              ),
              content: Text(
                content,
                style: TextStyle(
                    fontFamily: FontFamily.semibold,
                    color: AppColors.grey,
                    fontSize: 18.sp),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            ));
  }
}
