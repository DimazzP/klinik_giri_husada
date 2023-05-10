import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/FontFamily.dart';
import '../helpers/colorThemes.dart';
import 'TextHelper.dart';

class SQueue_Value extends StatelessWidget {
  SQueue_Value(
      {required this.image, required this.title, required this.value, Key? key})
      : super(key: key);

  String image;
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(image, height: 40.h, width: 40.w),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHelper(
                    text: 'Nama Pasien',
                    fontSize: 14.sp,
                    fontColor: AppColors.grey,
                    fontFamily: FontFamily.medium),
                TextHelper(
                    text: 'Budi Astaman',
                    fontSize: 16.sp,
                    fontFamily: FontFamily.bold),
              ],
            ),
          )
        ],
      ),
    );
  }
}
