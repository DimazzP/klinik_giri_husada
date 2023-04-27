import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../helpers/colorThemes.dart';
import '../widgets/MenuWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final incolor = AppColors();
    var headmedium = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      appBar: customMyAppbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 15),
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(8)), // BorderRadius
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_home.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/doctor_img.png'),
                  ],
                ),
              ))
        ]),
      ),
      //   body: Container(
      //     margin: EdgeInsets.all(14),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Container(
      //             alignment: Alignment.topLeft,
      //             margin: EdgeInsets.symmetric(vertical: 14),
      //             child: Text("Silahkan Pilih Layanan",
      //                 style: TextStyle(
      //                   color: incolor.cblack,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                 )),
      //           ),
      //           GridView(
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               crossAxisSpacing: 14,
      //               mainAxisSpacing: 8,
      //               childAspectRatio: 3 / 3.1,
      //             ),
      //             children: [
      //               MenuWidget(
      //                   onClick: () {
      //                     Navigator.of(context).pushNamed("/queue");
      //                   },
      //                   textButton: 'Pelayanan Gawat Darurat',
      //                   imageButton: 'assets/images/heart.png'),
      //               MenuWidget(
      //                   onClick: () {
      //                     Navigator.of(context).pushNamed("/queue");
      //                   },
      //                   textButton: 'Pelayanan Balita Sakit',
      //                   imageButton: 'assets/images/balita.png'),
      //               MenuWidget(
      //                   onClick: () {
      //                     Navigator.of(context).pushNamed("/queue");
      //                   },
      //                   textButton: 'Pelayanan TBC',
      //                   imageButton: 'assets/images/tbc.png'),
      //               MenuWidget(
      //                   onClick: () {
      //                     Navigator.of(context).pushNamed("/queue");
      //                   },
      //                   textButton: 'Konsultasi Gizi',
      //                   imageButton: 'assets/images/gizi.png'),
      //               MenuWidget(
      //                   onClick: () {
      //                     Navigator.of(context).pushNamed("/queue");
      //                   },
      //                   textButton: 'Pelayanan Imunisasi',
      //                   imageButton: 'assets/images/imunisasi.png'),
      //               MenuWidget(
      //                   onClick: () {
      //                     Navigator.of(context).pushNamed("/queue");
      //                   },
      //                   textButton: 'Pelayanan Gigi dan Mulut',
      //                   imageButton: 'assets/images/gigi.png'),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}

final AppBar customMyAppbar = AppBar(
  title: Row(children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat Datang",
          style: TextStyle(
            color: Color(0xff818181),
            fontSize: 14,
          ),
        ),
        Text(
          "Budiyono Astaman",
          style: TextStyle(
              color: Color(0xff24141E),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ],
    )
  ]),
  backgroundColor: Color(0xffF1F1F1),
  automaticallyImplyLeading: false,
);
