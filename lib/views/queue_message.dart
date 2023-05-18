import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:klinik_giri_husada/controllers/QueueController.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';
import 'package:klinik_giri_husada/models/LayananModel.dart';
import 'package:klinik_giri_husada/models/ModelHourMinute.dart';
import 'package:klinik_giri_husada/models/ModelToken.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
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
  DateTime? minimumDate;
  DateTime? maximumDate;
  int? endHour;
  int? endMinute;
  ScrollController _scrollController = ScrollController();
  int? dataId;
  String? _dateToString;
  DateTime? _selectedDate;
  String? _selectedDateString;
  int? selectedCustomRadio;
  bool? isHour;
  int? antrianku;
  bool? btnDaftar;
  bool? _isLoading;
  String? _pendingDateString;
  DateTime? _pendingDate;
  List<ModelHourMinute>? _resultHour = [];
  List<ModelHourMinute>? _disableHour;
  List<ModelHourMinute>? _showHour() {
    List<ModelHourMinute> checkMyHour;
    checkMyHour = [
      ModelHourMinute(8, 0),
      ModelHourMinute(8, 30),
      ModelHourMinute(9, 0),
      ModelHourMinute(9, 30),
      ModelHourMinute(10, 0),
      ModelHourMinute(11, 0),
      ModelHourMinute(11, 30),
      ModelHourMinute(13, 0),
      ModelHourMinute(13, 30),
      ModelHourMinute(14, 0),
      ModelHourMinute(14, 30),
      ModelHourMinute(15, 0),
      ModelHourMinute(15, 30),
      ModelHourMinute(16, 0),
      ModelHourMinute(16, 30),
      ModelHourMinute(17, 0),
      ModelHourMinute(17, 30),
    ];
    return checkMyHour;
  }

  List<ModelHourMinute> compareAndRemoveDuplicates(
      List<ModelHourMinute> list1, List<ModelHourMinute> list2) {
    List<ModelHourMinute> result =
        List<ModelHourMinute>.from(list1); // Membuat copy list pertama

    for (ModelHourMinute person in list2) {
      result.removeWhere((element) =>
          element.hour == person.hour && element.minute == person.minute);
    }

    return result;
  }

  void btDaftar() async {
    UserResponse myObject = await ModelToken.getUserData();
    String idku = myObject.profile!.pasien_id.toString();

    AwesomeWidget.infoDialog(context, 'Daftarkan Diri Sebagai Pasien?',
        'Klik tombol "OK" jika anda ingin mendaftar ke layanan dan mendapatkan nomor antrian.',
        () {
      Navigator.pop(context);
      String inputDate =
          '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day} $endHour:$endMinute:00';
      QueueController.btRegist(context, inputDate, 'BERLANGSUNG', idku,
          dataId.toString(), antrianku.toString());
    });
  }

  void btJam() async {
    btnDaftar = false;
    isHour = true;
    _selectedDate = _pendingDate;
    _selectedDateString = '$_pendingDateString';
    _dateToString = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    DaftarModel.checkHour(context, '${_dateToString}', dataId.toString())
        .then((value) {
      if (value.status == 200) {
        _disableHour = _showHour();
        List<ModelHourMinute>? listJamIni = [];

        for (var i = 0; i < value.data!.length; i++) {
          DateTime hapusTanggal =
              DateTime.parse(value.data![i].daftar_tanggal.toString());
          ModelHourMinute jamIni =
              ModelHourMinute(hapusTanggal.hour, hapusTanggal.minute);
          listJamIni.add(jamIni);
        }
        _resultHour = compareAndRemoveDuplicates(_disableHour!, listJamIni);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() {});
        });
      } else {
        AwesomeWidget.errorDialog(context, value.title!, value.message!);
      }
    });
    Navigator.pop(context);
  }

  Widget _customRadio(String jam, String menit, int index) {
    String formattedTime = DateFormat('HH:mm').format(DateTime(
        0, 0, 0, _resultHour![index].hour, _resultHour![index].minute));
    return ElevatedButton(
        onPressed: () {
          setState(() {
            btnDaftar = true;
            endHour = int.parse(jam);
            endMinute = int.parse(menit);
            selectedCustomRadio = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: (selectedCustomRadio == index)
              ? AppColors.primary
              : AppColors.grey3, // Ubah warna latar belakang (background color)
          // onPrimary: Colors.white, // Ubah warna teks (text color)
        ),
        child: TextHelper(
          text: '$formattedTime',
          fontSize: 16.sp,
          fontColor:
              selectedCustomRadio == index ? Colors.white : AppColors.black,
          fontFamily: FontFamily.semibold,
        ));
  }

  void localDate() async {
    await initializeDateFormatting('id_ID', null);
  }

  @override
  void initState() {
    btnDaftar = false;
    isHour = false;
    // minimumDate = DateTime.now().add(const Duration(days: 1));
    DateTime now = DateTime.now();
    minimumDate = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    maximumDate = DateTime.now().add(const Duration(days: 30));
    _selectedDateString = 'Pilih Tanggal';
    _selectedDate = DateTime.now().add(const Duration(days: 1));
    _pendingDate = _selectedDate;
    _dateToString = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    localDate();
    _pendingDateString =
        DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(_pendingDate!);
    _isLoading = true;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paddingMedia = 12.h;
    dataId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(
        context: context,
        titleText: 'Pendaftaran Pasien',
      ),
      body: FutureBuilder(
        future:
            LayananModel.getJenis(dataId.toString(), _dateToString.toString()),
        builder: (context, snapshot) {
          String? dokter = snapshot.data?.data?.pekerja_nama;
          String? layanan = snapshot.data?.data?.jenis_layanan;
          var checkAntrian = snapshot.data?.antrian;
          int? antrian;
          checkAntrian != null
              ? antrian = snapshot.data!.antrian!.daftar_nomor
              : antrian = 0;
          antrianku = antrian! + 1;
          return SafeArea(
              child: !snapshot.hasData
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          Container(
                            alignment: Alignment.topCenter,
                            height: 200.h,
                            child: Image.asset('assets/images/gbdokter.png'),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Wrap(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 11.h),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8.h),
                                        width: double.infinity,
                                        child: Column(children: [
                                          TextHelper(
                                            text: 'Nama Layanan',
                                            fontSize: 16.sp,
                                            fontFamily: FontFamily.regular,
                                            fontColor: AppColors.grey,
                                          ),
                                          TextHelper(
                                            text: '$layanan',
                                            fontSize: 20.sp,
                                            fontFamily: FontFamily.semibold,
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 1.h,
                                        color: AppColors.grey3,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: paddingMedia),
                                        width: double.infinity,
                                        child: Column(children: [
                                          TextHelper(
                                            text: 'Jumlah Kuota',
                                            fontSize: 16.sp,
                                            fontFamily: FontFamily.regular,
                                            fontColor: AppColors.grey,
                                          ),
                                          TextHelper(
                                            text: '$antrian/16',
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
                                        margin: EdgeInsets.symmetric(
                                            vertical: paddingMedia),
                                        width: double.infinity,
                                        child: Column(children: [
                                          TextHelper(
                                            text: 'Dokter',
                                            fontSize: 16.sp,
                                            fontFamily: FontFamily.regular,
                                            fontColor: AppColors.grey,
                                          ),
                                          TextHelper(
                                            text: '$dokter',
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
                                      SizedBox(height: 24.h),
                                      TextHelper(
                                        text: 'Pilih Tanggal Kunjungan',
                                        fontSize: 18.sp,
                                        fontFamily: FontFamily.bold,
                                        fontColor: AppColors.primary,
                                      ),
                                      SizedBox(height: 28.h),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(AppColors
                                                  .grey3), // Ubah warna latar belakang menjadi merah
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ClipRRect(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 20.h,
                                                            bottom: 8.h),
                                                        alignment:
                                                            Alignment.center,
                                                        child: TextHelper(
                                                          text:
                                                              'Pilih Hari Kunjungan',
                                                          fontSize: 20.sp,
                                                          fontColor:
                                                              AppColors.grey,
                                                          fontFamily: FontFamily
                                                              .semibold,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 300.h,
                                                        child:
                                                            CupertinoDatePicker(
                                                          initialDateTime:
                                                              _selectedDate,
                                                          maximumDate:
                                                              maximumDate,
                                                          minimumDate:
                                                              minimumDate, // Batas maksimum: hari yang sama dengan jam 23:59
                                                          mode:
                                                              CupertinoDatePickerMode
                                                                  .date,
                                                          onDateTimeChanged:
                                                              (DateTime
                                                                  date) async {
                                                            _pendingDate = date;

                                                            _pendingDateString =
                                                                DateFormat(
                                                                        'EEEE, d MMMM yyyy',
                                                                        'id_ID')
                                                                    .format(
                                                                        date);
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 90.w,
                                                        constraints:
                                                            BoxConstraints(
                                                                maxWidth: 100),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                btJam();
                                                              });
                                                            },
                                                            child: TextHelper(
                                                              text: 'OK',
                                                              fontSize: 18.sp,
                                                              fontColor:
                                                                  Colors.white,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 4.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextHelper(
                                                text: '$_selectedDateString',
                                                fontSize: 16.sp,
                                              ),
                                              Icon(
                                                Icons.calendar_month,
                                                color: AppColors.primary,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 50.h),
                                      Visibility(
                                        visible: isHour!,
                                        child: ListView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: TextHelper(
                                                text: 'Pilih Jam Kunjungan',
                                                fontSize: 18.sp,
                                                fontFamily: FontFamily.bold,
                                                fontColor: AppColors.primary,
                                              ),
                                            ),
                                            SizedBox(height: 20.h),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12.w),
                                                // alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    top: 4.h, bottom: 4.h),
                                                child: Wrap(
                                                  alignment:
                                                      WrapAlignment.spaceEvenly,
                                                  runSpacing: 8.w,
                                                  spacing: 8.w,
                                                  children: List.generate(
                                                      _resultHour!.length,
                                                      (index) {
                                                    return Container(
                                                        child: _customRadio(
                                                            _resultHour![index]
                                                                .hour
                                                                .toString(),
                                                            _resultHour![index]
                                                                .minute
                                                                .toString(),
                                                            index));
                                                  }),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 36.h),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.r))),
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: btnDaftar == true
                ? AppColors.primary
                : AppColors.grey2, // Ubah warna latar belakang
            side: BorderSide.none, // Hapus border
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                btnDaftar == true
                    ? 'assets/images/tiket.png'
                    : 'assets/images/tiketgrey.png',
                height: 20.h,
              ),
              SizedBox(width: 4.w),
              TextHelper(
                text: 'Daftar Antrian',
                fontSize: 20.sp,
                fontColor: btnDaftar == true ? Colors.white : AppColors.grey,
                fontFamily: FontFamily.semibold,
              ),
            ],
          ),
          onPressed: btnDaftar == true
              ? () {
                  btDaftar();
                }
              : () {},
        ),
      ),
    );
  }
}
