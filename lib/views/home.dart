import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/models/LayananModel.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/FontSize.dart';
import '../helpers/colorThemes.dart';
import '../models/DaftarModel.dart';
import '../models/UserModel.dart';
import '../widgets/MenuWidget.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DaftarResponse> data = [];

  void tampilkanData() async {
    DaftarModel.tampilDaftar(context).then((value) {
      data = value.data!;
      setState(() {});
    });
  }

  // String time(int index) {
  //   DateFormat myFormat = DateFormat('yyyy-MM-dd');
  //   DateTime date = myFormat.parse(data[index].daftar_tanggal!);
  //   date = DateTime(date.year, date.month, date.day, 7, 30);
  //   int? nomorAntrian = data[index].daftar_nomor;
  //   nomorAntrian! > 8
  //       ? date = date.add(Duration(minutes: nomorAntrian * 30 + 60))
  //       : date = date.add(Duration(minutes: nomorAntrian * 30));
  //   String formattedTime = DateFormat('HH:mm').format(date);
  //   return '${formattedTime}';
  // }

  @override
  void initState() {
    super.initState();
    tampilkanData();
  }

  @override
  Widget build(BuildContext context) {
    String time(int index) {
      DateFormat myFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      DateTime date = myFormat.parse(data[index].daftar_tanggal.toString());
      String formattedTime = DateFormat('HH:mm').format(date);
      return '${formattedTime}';
    }

    String myDate(int index) {
      DateFormat myFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      DateTime date = myFormat.parse(data[index].daftar_tanggal.toString());
      String formattedTime = DateFormat('dd-MM-yyyy').format(date);
      return '${formattedTime}';
    }

    return Scaffold(
        appBar: AppBar(
          title: FutureBuilder<String>(future: () async {
            final storage = new FlutterSecureStorage();
            String? jsonString = await storage.read(key: 'userdata');
            UserResponse myObject =
                UserResponse.fromJson(json.decode(jsonString!));
            return myObject.profile!.pasien_nama.toString();
          }(), builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            final FittedFont fittedFont = new FittedFont(context);
            if (snapshot.hasData) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHelper(
                          text: 'Selamat Datang',
                          fontSize: 14.sp,
                          fontColor: AppColors.grey,
                          fontFamily: FontFamily.medium,
                        ),
                        TextHelper(
                          text: snapshot.data.toString(),
                          fontSize: 16.sp,
                          fontFamily: FontFamily.semibold,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/account');
                        },
                        icon: Icon(Icons.settings))
                  ]);
            } else {
              // tampilkan indikator loading jika pengambilan sedang berlangsung
              return CircularProgressIndicator();
            }
          }),
          backgroundColor: Color(0xffF1F1F1),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 26.h),
              Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(8.r)), // BorderRadius
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg_home.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    child: Row(
                      children: [
                        Image.asset('assets/images/doctor_img.png'),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: TextHelper(
                                    text: 'Layanan Medis Cepat & Mudah',
                                    fontSize: 16.sp,
                                    fontFamily: FontFamily.bold,
                                    fontColor: Colors.white,
                                  )),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.h),
                                  child: TextHelper(
                                    text:
                                        'Kami menawarkan tenaga medis ahli untuk memberikan perawatan terbaik kepada anda',
                                    fontSize: 14.sp,
                                    fontFamily: FontFamily.medium,
                                    fontColor: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 30.h),
              //! umum
              Container(
                height: 167.h,
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.grey,
                        blurRadius: 2.0,
                        offset: Offset(0, 0.75),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16.h, bottom: 8.h),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: TextHelper(
                          text: "Layanan Kami",
                          fontSize: 20.sp,
                          fontFamily: FontFamily.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/queue',
                                arguments: 1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: SizedBox(
                            width: 80.w,
                            height: 100.h,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/images/umum_ic.png',
                                    width: 46.w,
                                  ),
                                ),
                                TextHelper(
                                  text: 'Umum',
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                  fontFamily: FontFamily.semibold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //! gigi
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/queue',
                                arguments: 2);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: SizedBox(
                            width: 80.w,
                            height: 100.h,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/images/gigi_ic.png',
                                    width: 46.w,
                                  ),
                                ),
                                TextHelper(
                                  text: 'Gigi',
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                  fontFamily: FontFamily.semibold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //! ibu & anak
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/queue',
                                arguments: 3);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: SizedBox(
                            width: 80.w,
                            height: 100.h,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/images/bayi_ic.png',
                                    width: 46.w,
                                  ),
                                ),
                                TextHelper(
                                  text: 'Ibu & Anak',
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                  fontFamily: FontFamily.semibold,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHelper(
                          text: 'Riwayat',
                          fontSize: 20.sp,
                          fontFamily: FontFamily.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/history');
                          },
                          child: TextHelper(
                            text: 'Lihat Semua',
                            fontSize: 16.sp,
                            fontFamily: FontFamily.semibold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    data.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Center(
                              child: TextHelper(
                                text: 'Tidak ada riwayat',
                                fontSize: 18.sp,
                                fontColor: AppColors.grey,
                                fontFamily: FontFamily.regular,
                              ),
                            ),
                          )
                        : GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 4 / 5.2,
                            children: List.generate(
                              data.length <= 2 ? data.length : 2,
                              (index) {
                                DaftarResponse kirimData = data[index];
                                Color bgColor;
                                switch (data[index].daftar_status) {
                                  case "BERLANGSUNG":
                                    bgColor = Colors.grey;
                                    break;
                                  case "BATAL":
                                    bgColor = Colors.red.withOpacity(0.95);
                                    break;
                                  case "SELESAI":
                                    bgColor = AppColors.green;
                                    break;
                                  default:
                                    bgColor = Colors.grey;
                                }

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/register_queue',
                                      arguments: kirimData,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Container(
                                            height: 50.h,
                                            width: 50.w,
                                            color: Colors.white,
                                            child: Image.asset(
                                              'assets/images/${data[index].jenis_layanan.toString().replaceAll(' ', '').toLowerCase()}_icon.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        TextHelper(
                                          text: '${myDate(index)}',
                                          fontSize: 15.sp,
                                          fontColor: AppColors.grey,
                                          fontFamily: FontFamily.regular,
                                        ),
                                        TextHelper(
                                          text:
                                              'Pelayanan ${data[index].jenis_layanan}',
                                          fontSize: 16.sp,
                                          fontFamily: FontFamily.bold,
                                        ),
                                        TextHelper(
                                          // text: 'Jam ${time(index)}',
                                          text: '${time(index)}',
                                          fontSize: 16.sp,
                                          fontFamily: FontFamily.semibold,
                                        ),
                                        SizedBox(height: 10.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          child: Container(
                                              width: 120.w,
                                              alignment: Alignment.center,
                                              color: bgColor,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 4.h,
                                              ),
                                              child: TextHelper(
                                                text: data[index].daftar_status,
                                                fontSize: 14.sp,
                                                fontFamily: FontFamily.bold,
                                                fontColor: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              )
            ]),
          ),
        )));
  }
}
