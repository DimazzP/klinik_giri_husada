import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/controllers/QueueController.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import '../helpers/colorThemes.dart';
import '../models/UserModel.dart';
import '../widgets/AppbarWidget.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({super.key});

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  DateTime _tomorrow = DateTime.now().add(Duration(days: 1));
  DateTime _dateTime = DateTime.now().add(Duration(days: 1));
  DateTime threedays = DateTime.now().add(const Duration(days: 3));
  String? _dateToString;

  @override
  void initState() {
    // TODO: implement initState
    _dateToString = '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}';
    super.initState();
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: _tomorrow,
        lastDate: threedays,
      );

  @override
  Widget build(BuildContext context) {
    final paddingMedia = 12.h;

    return Scaffold(
      appBar: AppbarWidget(
        context: context,
        titleText: 'Mendaftarkan Antrian',
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 24.h),
          Container(
            alignment: Alignment.topCenter,
            height: 200.h,
            child: Image.asset('assets/images/gbdokter.png'),
          ),
          SizedBox(height: 24.h),
          Expanded(
              child: Container(
            alignment: Alignment.bottomLeft,
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.grey,
                          blurRadius: 2.0,
                          offset: Offset(0, 0.75),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 11.h),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        width: double.infinity,
                        child: Column(children: [
                          TextHelper(
                            text: 'Nama Layanan',
                            fontSize: 16.sp,
                            fontFamily: FontFamily.regular,
                            fontColor: AppColors.grey,
                          ),
                          TextHelper(
                            text: 'Konsultasi Gizi',
                            fontSize: 20.sp,
                            fontFamily: FontFamily.semibold,
                          ),
                        ]),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.h,
                        color: AppColors.grey2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: paddingMedia),
                        width: double.infinity,
                        child: Column(children: [
                          TextHelper(
                            text: 'Jumlah Kuota',
                            fontSize: 16.sp,
                            fontFamily: FontFamily.regular,
                            fontColor: AppColors.grey,
                          ),
                          TextHelper(
                            text: '18/32',
                            fontSize: 20.sp,
                            fontFamily: FontFamily.semibold,
                          ),
                        ]),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.h,
                        color: AppColors.grey2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: paddingMedia),
                        width: double.infinity,
                        child: Column(children: [
                          TextHelper(
                            text: 'Dokter',
                            fontSize: 16.sp,
                            fontFamily: FontFamily.regular,
                            fontColor: AppColors.grey,
                          ),
                          TextHelper(
                            text: 'Ahmad Ali',
                            fontSize: 20.sp,
                            fontFamily: FontFamily.semibold,
                          ),
                        ]),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.h,
                        color: AppColors.grey2,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  final _date = await pickDate();
                                  if (_date == null) return;
                                  setState(() {
                                    _dateTime = _date;
                                    _dateToString =
                                        '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}';
                                  });
                                },
                                icon: IconTheme(
                                  data: new IconThemeData(
                                    color: AppColors.primary,
                                  ),
                                  child: Icon(Icons.calendar_month),
                                ),
                                label: Container(
                                    child: Row(children: [
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.w,
                                                vertical: 16.h),
                                            child: TextHelper(
                                                text:
                                                    '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}',
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    FontFamily.semibold),
                                          ))),
                                ])),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffF1F1F1)),
                              ))),
                      SizedBox(height: 36.h),
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                          child: Container(
                              width: double.infinity,
                              height: 47.h,
                              child: ElevatedButton(
                                child: TextHelper(
                                  text: 'Daftar Antrian',
                                  fontSize: 20.sp,
                                  fontColor: Colors.white,
                                  fontFamily: FontFamily.semibold,
                                ),
                                onPressed: () async {
                                  final storage = new FlutterSecureStorage();
                                  String? jsonString =
                                      await storage.read(key: 'userdata');
                                  // String? token = await storage.read(key: 'token');
                                  UserResponse myObject = UserResponse.fromJson(
                                      json.decode(jsonString!));
                                  String idku =
                                      myObject.profile!.pasien_id.toString();
                                  // return myObject.profile!.pasien_nama.toString();

                                  QueueController.btRegist(
                                      context,
                                      _dateToString.toString(),
                                      'Diproses',
                                      idku,
                                      '1',
                                      '1');
                                },
                              ))),
                      SizedBox(height: 36.h),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      )),
    );
  }
}
