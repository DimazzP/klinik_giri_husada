import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/colorThemes.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  void tampilkanData() async {
    data = [];
    dataBatal = [];
    dataBerlangsung = [];
    dataSelesai = [];
    DaftarModel.tampilDaftar(context).then((value) {
      data = value.data!;
      for (var i = 0; i < data.length; i++) {
        if (data[i].daftar_status.toString() == 'BATAL') {
          dataBatal.add(data[i]);
        } else if (data[i].daftar_status.toString() == 'SELESAI') {
          dataSelesai.add(data[i]);
        } else if (data[i].daftar_status.toString() == 'BERLANGSUNG') {
          dataBerlangsung.add(data[i]);
        }
      }
      setState(() {});
    });
  }

  void changeValue() {
    setState(() {
      tampilkanData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tampilkanData();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List<DaftarResponse> data = [];
  List<DaftarResponse> dataBatal = [];
  List<DaftarResponse> dataSelesai = [];
  List<DaftarResponse> dataBerlangsung = [];
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xfff1f1f1),
        appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                  // Navigator.pop(context, 'refresh');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Riwayat Pendaftaran',
                  style:
                      TextStyle(fontFamily: FontFamily.bold, fontSize: 18.sp),
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Color(0xffFFFFFF),
          automaticallyImplyLeading: false,
        ),
        body: DefaultTabController(
          length: myTab.length, // Jumlah tab
          initialIndex: 0,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelStyle: TextStyle(fontFamily: FontFamily.bold),
                  unselectedLabelColor: AppColors.grey,
                  tabs: myTab,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.h),
                  child: TabBarView(
                    children: [
                      ListHistory(myData: data, onClick: changeValue),
                      ListHistory(
                          myData: dataBerlangsung, onClick: changeValue),
                      ListHistory(myData: dataSelesai, onClick: changeValue),
                      ListHistory(myData: dataBatal, onClick: changeValue),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Tab> myTab = [
  Tab(
    child: Container(
      constraints: BoxConstraints(minWidth: 100.w),
      margin: EdgeInsets.symmetric(horizontal: 4.w),

      // width: 100.w,
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
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      constraints: BoxConstraints(minWidth: 100.w),
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
      constraints: BoxConstraints(minWidth: 100.w),
      margin: EdgeInsets.symmetric(horizontal: 4.w),

      // width: 100.w,
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
      margin: EdgeInsets.symmetric(horizontal: 4.w),

      constraints: BoxConstraints(minWidth: 100.w),
      // width: 100.w,
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
  )
];

class ListHistory extends StatefulWidget {
  List<DaftarResponse> myData;
  VoidCallback onClick;

  ListHistory({required this.myData, required this.onClick});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  Color getMyColor(String warna) {
    if (warna == 'BERLANGSUNG') {
      return AppColors.yellow;
    } else if (warna == 'SELESAI') {
      return AppColors.green;
    } else {
      return Colors.red;
    }
  }

  String time(int index) {
    DateFormat myFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime date =
        myFormat.parse(widget.myData[index].daftar_tanggal.toString());
    String formattedTime = DateFormat('HH:mm').format(date);
    return '${formattedTime}';
  }

  String myDate(int index) {
    DateFormat myFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime date =
        myFormat.parse(widget.myData[index].daftar_tanggal.toString());
    String formattedTime = DateFormat('dd-MM-yyyy').format(date);
    return '${formattedTime}';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.myData.isEmpty
        ? FutureBuilder(
            future: Future.delayed(
                Duration(seconds: 1)), // Future.delayed dengan durasi 2 detik
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    height: 40.h,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                      child: TextHelper(
                    text: 'Riwayat Kosong',
                    fontSize: 18.sp,
                  )),
                );
              }
            },
          )
        : Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.myData.length,
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
                        setState(() async {
                          DaftarResponse kirimData = widget.myData[index];
                          var refresh = await Navigator.pushNamed(
                            context,
                            '/register_queue',
                            arguments: kirimData,
                          );
                          print('sudah refresh kah ? ' + refresh.toString());
                          if (refresh == 'refresh') {
                            widget.onClick();
                          }
                          // Navigator.pushNamed(context, '/register_queue',
                          //     arguments: kirimData);
                        });
                      },
                      leading: Container(
                        alignment: Alignment.center,
                        width: 50.sp,
                        height: 50.sp,
                        child: TextHelper(
                          text: '${widget.myData[index].daftar_id}',
                          fontSize: 24.sp,
                          fontFamily: FontFamily.bold,
                          fontColor: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                getMyColor(widget.myData[index].daftar_status
                                    .toString()),
                                AppColors.black2
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          // color: getMyColor(
                          //     myData[index].daftar_status.toString()),
                        ),
                      ),
                      trailing: TextHelper(
                        text: myDate(index),
                        fontSize: 14.sp,
                        fontColor: AppColors.grey,
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: TextHelper(
                          text:
                              'Pelayanan ${widget.myData[index].jenis_layanan}',
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
          );
  }
}
