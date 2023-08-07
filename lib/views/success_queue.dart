import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:klinik_giri_husada/controllers/QueueController.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';
import 'package:klinik_giri_husada/models/UserModel.dart';
import 'package:klinik_giri_husada/widgets/DashedLinePainter.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:intl/intl.dart';

class SuccessQueue extends StatefulWidget {
  const SuccessQueue({super.key});

  @override
  State<SuccessQueue> createState() => _SuccessQueueState();
}

class _SuccessQueueState extends State<SuccessQueue> {
  bool? checkStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus = false;
  }

  @override
  Widget build(BuildContext context) {
    DaftarResponse daftarResponse =
        ModalRoute.of(context)!.settings.arguments as DaftarResponse;
    daftarResponse.daftar_status == 'BERLANGSUNG'
        ? checkStatus = true
        : checkStatus = false;
    String time() {
      DateFormat myFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      DateTime date = myFormat.parse(daftarResponse.daftar_tanggal!);
      String formattedTime = DateFormat('HH:mm').format(date);
      return '${formattedTime}';
    }

    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, 'refresh');
          return true;
        },
        child: Scaffold(
          backgroundColor: Color(0xfff1f1f1),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
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
                        text: daftarResponse.jenis_layanan,
                        fontSize: 24.sp,
                        fontFamily: FontFamily.bold,
                      ),
                      SizedBox(height: 9.h),
                      TextHelper(
                        text:
                            'Pendaftaran Jenis Layanan ${daftarResponse.jenis_layanan}',
                        fontSize: 16.sp,
                        fontColor: AppColors.grey,
                      ),
                      SizedBox(height: 24.h),
                      TextHelper(
                          text: '${daftarResponse.daftar_id}', fontSize: 80.sp),
                      TextHelper(
                          text: 'NOMOR PESANAN',
                          fontSize: 16.sp,
                          fontColor: AppColors.grey),
                      SizedBox(height: 36.h),
                      TextHelper(
                          text: '${daftarResponse.daftar_status}',
                          fontSize: 18.sp,
                          fontFamily: FontFamily.bold,
                          fontColor: daftarResponse.daftar_status == 'BATAL'
                              ? Colors.red
                              : AppColors.primary),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/right_circle.png',
                              height: 40.h),
                          Expanded(
                            child: Container(
                              height: 1,
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              child:
                                  const DashedLinePainter(color: Colors.grey),
                            ),
                          ),
                          Image.asset('assets/images/left_circle.png',
                              height: 40.h),
                        ],
                      ),
                      SizedBox(height: 4),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 16.h),
                          child: FutureBuilder<List<String>>(future: () async {
                            String responseTanggal =
                                daftarResponse.daftar_tanggal.toString();

                            DateFormat format = DateFormat('yyyy-MM-dd');
                            DateTime parsed = format.parse(responseTanggal);
                            await initializeDateFormatting('id_ID', null);

                            String tanggal =
                                DateFormat('EEEE, d MMMM yyyy', 'id_ID')
                                    .format(parsed);

                            final storage = new FlutterSecureStorage();
                            String? jsonString =
                                await storage.read(key: 'userdata');
                            UserResponse myObject =
                                UserResponse.fromJson(json.decode(jsonString!));
                            List<String> myArray = [];
                            myArray
                                .add(myObject.profile!.pasien_nama.toString());
                            myArray.add(tanggal);
                            return myArray;
                          }(), builder:
                              (context1, AsyncSnapshot<List<String>> snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  isiContain(
                                      'assets/images/sc_dokter.png',
                                      'Nama Pasien',
                                      '${snapshot.data![0].toString()}'),
                                  isiContain(
                                      'assets/images/sc_tanggal.png',
                                      'Tanggal',
                                      '${snapshot.data![1].toString()}, ${time()} WIB'),
                                  // isiContain(
                                  //     'assets/images/sc_antrian.png',
                                  //     'Jumlah Antrian',
                                  //     '${daftarResponse.daftar_nomor}/16'),
                                  isiContain(
                                      'assets/images/sc_dokter.png',
                                      'Nama Dokter',
                                      '${daftarResponse.pekerja_nama}'),
                                ],
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                        ),
                      ),
                      // SizedBox(height: 16.h),
                      Visibility(
                        visible: checkStatus!,
                        child: Container(
                          // width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              QueueController.batalkan(
                                  context, daftarResponse.daftar_id.toString());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 4.h),
                              child: TextHelper(
                                text: 'Batalkan',
                                fontSize: 20.sp,
                                fontColor: Colors.white,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                )
              ],
            ),
          )),
          bottomNavigationBar: Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'refresh');
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/home', (route) => false);
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
        ));
  }
}

Widget isiContain(String image, String title, String value) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 28.h,
            width: 28.w,
          ),
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
                    fontFamily: FontFamily.semibold),
              ],
            ),
          )
        ],
      ));
}
