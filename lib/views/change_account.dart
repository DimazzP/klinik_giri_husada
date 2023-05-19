import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/widgets/AppbarWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

class ChangeAccount extends StatefulWidget {
  const ChangeAccount({super.key});

  @override
  State<ChangeAccount> createState() => _ChangeAccountState();
}

class _ChangeAccountState extends State<ChangeAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppbarWidget(context: context, titleText: 'Ubah Akun'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 30.h),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: TextHelper(
                      text: 'Ubah Data Akun Saya',
                      fontSize: 24.sp,
                      fontFamily: FontFamily.bold,
                    ),
                  )),
                  Expanded(child: Container()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
