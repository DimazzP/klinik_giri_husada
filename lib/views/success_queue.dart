import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';
import 'package:klinik_giri_husada/widgets/DashedLinePainter.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

class SuccessQueue extends StatelessWidget {
  const SuccessQueue({super.key});

  @override
  Widget build(BuildContext context) {
    final int daftar_id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        backgroundColor: Color(0xfff1f1f1),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              alignment: Alignment.center,
              child: TextHelper(
                text: 'Nomor Antrian Anda',
                fontSize: 20.sp,
                fontFamily: FontFamily.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 29.w),
              // color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 27.h),
                  TextHelper(
                    text: 'Umum',
                    fontSize: 24.sp,
                    fontFamily: FontFamily.bold,
                  ),
                  SizedBox(height: 9.h),
                  TextHelper(
                    text: 'Pendaftaran Jenis Layanan Umum',
                    fontSize: 16.sp,
                    fontColor: AppColors.grey,
                  ),
                  SizedBox(height: 24.h),
                  TextHelper(text: '1', fontSize: 80.sp),
                  TextHelper(
                      text: 'NOMOR ANTRIAN',
                      fontSize: 16.sp,
                      fontColor: AppColors.grey),
                  SizedBox(height: 36.h),
                  TextHelper(
                      text: 'BERLANGSUNG',
                      fontSize: 18.sp,
                      fontFamily: FontFamily.bold,
                      fontColor: AppColors.primary),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/right_circle.png',
                          height: 50.h),
                      Expanded(
                        child: Container(
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: const DashedLinePainter(color: Colors.grey),
                        ),
                      ),
                      Image.asset('assets/images/left_circle.png',
                          height: 50.h),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 16.h),
                      child: Column(children: [
                        isiContain('assets/images/sc_dokter.png', 'Nama Pasien',
                            'Budi Astaman'),
                        isiContain('assets/images/sc_tanggal.png', 'Tanggal',
                            '10-05-2023'),
                        isiContain('assets/images/sc_antrian.png',
                            'Jumlah Antrian', '20/32'),
                        isiContain('assets/images/sc_dokter.png', 'Nama Dokter',
                            'Ahmad Ali'),
                      ]),
                    ),
                  ),
                  // SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: TextHelper(
                              text: 'Kembali',
                              fontSize: 20.sp,
                              fontColor: Colors.white,
                              fontFamily: FontFamily.semibold),
                        )),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            )
          ],
        )));
  }
}

Widget isiContain(String image, String title, String value) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Image.asset(image, height: 36.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHelper(
                    text: '$title',
                    fontSize: 14.sp,
                    fontColor: AppColors.grey,
                    fontFamily: FontFamily.medium),
                TextHelper(
                    text: '$value',
                    fontSize: 16.sp,
                    fontFamily: FontFamily.bold),
              ],
            ),
          )
        ],
      ));
}
