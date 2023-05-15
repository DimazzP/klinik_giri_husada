import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/FontFamily.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Akun Saya',
                style: TextStyle(fontFamily: FontFamily.bold, fontSize: 20.sp),
              ),
            ),
            Container(),
          ],
        ),
        elevation: 0,
        backgroundColor: const Color(0xfff1f1f1),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: 53.h),
            //image
            SizedBox(height: 84.h),
            Container(
              child: Text('test'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.r))),
            )
          ],
        ),
      ),
    );
  }
}
