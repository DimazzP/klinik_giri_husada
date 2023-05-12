import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/models/DaftarModel.dart';
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

class _HistoryPageState extends State<HistoryPage> {
  List<DaftarResponse> data = [];

  void tampilkanData() async {
    DaftarModel.tampilDaftar(context).then((value) {
      data = value.data!;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tampilkanData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(context: context, titleText: 'Riwayat Pendaftaran'),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Text('test'),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
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
                          DaftarResponse kirimData = data[index];
                          Navigator.pushNamed(context, '/register_queue',
                              arguments: kirimData);
                        });
                      },
                      leading: Image.asset(
                        'assets/images/${data[index].daftar_status.toString().toLowerCase()}.png',
                        // height: 20,
                      ),
                      trailing: TextHelper(
                        text: data[index].daftar_tanggal,
                        fontSize: 14.sp,
                        fontColor: AppColors.grey,
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: TextHelper(
                          text: 'Pelayanan ${data[index].jenis_layanan}',
                          fontSize: 18.sp,
                          fontFamily: FontFamily.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 4.h),
                        child: TextHelper(
                            text:
                                'Nomor antrian anda akan dilayani pada jam 09.00 WIB}',
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
//  List<DataPatient> data = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     PatientModel.tampil().then((value) {
//       // print(value.kode);
//       setState(() {
//         data = value.data!;
//       });
//       // print(value.data![0].pasien_nama);
//       // print(data[0].pasien_nowa);
//     });
//     super.initState();
//   }
// final myAppbar =
//         AppbarWidget(context: context, titleText: "Riwayat Pesaan");
//     final appbarHeight = myAppbar.preferredSize.height;
//     final heightMedia = MediaQuery.of(context).size.height - appbarHeight;
//     final incolor = AppColors();
//     return Scaffold(
//       appBar: myAppbar,
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           // DataPatient dp = data[index];
//           return Container(
//             margin: EdgeInsets.all(6),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 1,
//                     offset: Offset(0, 2),
//                   )
//                 ]),
//             child: ListTile(
//               title: Text(data[index].pasien_nama.toString()),
//               subtitle: Text(data[index].pasien_nowa.toString()),
//               isThreeLine: true,
//               // dense: ,
//             ),
//           );
//         },
//         itemCount: data.length,
//       ),