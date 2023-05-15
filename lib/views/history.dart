import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/colorThemes.dart';
import '../models/PatientModel.dart';
import '../widgets/AppbarWidget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  List<DaftarResponse> data = [];
  late TabController _tabController;
  int _currentIndex = 0;
  List<DaftarResponse> myData = [];

  void tampilkanData() async {
    DaftarModel.tampilDaftar(context).then((value) {
      data = value.data!;
      myData = data;
      setState(() {});
    });
  }

  String time(int index) {
    DateTime date = DateTime.parse(myData[index].daftar_tanggal.toString());
    date = DateTime(date.year, date.month, date.day, 7, 30);
    int? nomorAntrian = myData[index].daftar_nomor;
    nomorAntrian! > 8
        ? date = date.add(Duration(minutes: nomorAntrian * 30 + 60))
        : date = date.add(Duration(minutes: nomorAntrian * 30));
    String formattedTime = DateFormat('HH:mm').format(date);
    return '$formattedTime';
  }

  void ubahData() {
    if (_currentIndex == 0) {
      myData = data;
    } else if (_currentIndex == 1) {
      myData = [];
      for (var i = 0; i < data.length; i++) {
        if (data[i].daftar_status.toString() == 'BERLANGSUNG') {
          myData.add(data[i]);
        }
      }
    } else if (_currentIndex == 2) {
      myData = [];
      for (var i = 0; i < data.length; i++) {
        if (data[i].daftar_status.toString() == 'SELESAI') {
          myData.add(data[i]);
        }
      }
    } else if (_currentIndex == 3) {
      myData = [];
      for (var i = 0; i < data.length; i++) {
        if (data[i].daftar_status.toString() == 'BATAL') {
          myData.add(data[i]);
        }
      }
    }
    setState(() {});
  }

  Color getMyColor(String warna) {
    if (warna == 'BERLANGSUNG') {
      return AppColors.yellow;
    } else if (warna == 'SELESAI') {
      return AppColors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    tampilkanData();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _tabController.removeListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _currentIndex = _tabController.index;
      ubahData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
                'Riwayat Pendaftaran',
                style: TextStyle(fontFamily: FontFamily.bold, fontSize: 18.sp),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        automaticallyImplyLeading: false,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.only(top: 6.h),
            color: Colors.white,
            child: TabBar(
              indicatorColor: AppColors.primary,
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.primary,
              labelPadding: EdgeInsets.zero,
              unselectedLabelStyle: TextStyle(fontFamily: FontFamily.bold),
              unselectedLabelColor: AppColors.grey,
              tabs: [
                Tab(
                  child: Container(
                    width: 100.w,
                    alignment: Alignment.center,
                    child: TextHelper(
                      text: 'Semua',
                      fontSize: 14.sp,
                      fontFamily: FontFamily.semibold,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 4.w),
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.yellow,
                          ),
                        ),
                        TextHelper(
                          text: 'Berlangsung',
                          fontSize: 14.sp,
                          fontFamily: FontFamily.semibold,
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 4.w),
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.green,
                          ),
                        ),
                        TextHelper(
                          text: 'Selesai',
                          fontSize: 14.sp,
                          fontFamily: FontFamily.semibold,
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 4.w),
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                        TextHelper(
                          text: 'Batal',
                          fontSize: 14.sp,
                          fontFamily: FontFamily.semibold,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Flexible(
            fit: FlexFit.tight,
            // flex: 20,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Warna bayangan
                          spreadRadius: 2, // Radius penyebaran bayangan
                          blurRadius: 5, // Radius blur bayangan
                          offset: Offset(0,
                              3), // Offset dari bayangan (horizontal, vertical)
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(5.sp),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          DaftarResponse kirimData = myData[index];
                          Navigator.pushNamed(context, '/register_queue',
                              arguments: kirimData);
                        });
                      },
                      leading: Container(
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: TextHelper(
                            text: '${myData[index].daftar_nomor}',
                            fontSize: 28.sp,
                            fontFamily: FontFamily.bold,
                            fontColor: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                getMyColor(
                                    myData[index].daftar_status.toString()),
                                AppColors.black2
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          // color: getMyColor(
                          //     myData[index].daftar_status.toString()),
                        ),
                      ),
                      trailing: TextHelper(
                        text: myData[index].daftar_tanggal,
                        fontSize: 14.sp,
                        fontColor: AppColors.grey,
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: TextHelper(
                          text: 'Pelayanan ${myData[index].jenis_layanan}',
                          fontSize: 18.sp,
                          fontFamily: FontFamily.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 4.h),
                        child: TextHelper(
                            text:
                                'Nomor antrian anda akan dilayani pada jam ${time(index)} WIB',
                            fontSize: 14.sp),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
