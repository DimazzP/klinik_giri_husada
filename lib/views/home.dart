import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

import '../helpers/FontSize.dart';
import '../helpers/colorThemes.dart';
import '../models/UserModel.dart';
import '../widgets/MenuWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppBar customMyAppbar = AppBar(
    title: FutureBuilder<String>(future: () async {
      final storage = new FlutterSecureStorage();
      String? jsonString = await storage.read(key: 'userdata');
      UserResponse myObject = UserResponse.fromJson(json.decode(jsonString!));
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
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      color: Color(0xff818181),
                      fontSize: fittedFont.small,
                    ),
                  ),
                  TextHelper(
                      text: snapshot.data.toString(),
                      fontSize: fittedFont.medium)
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings))
            ]);
      } else {
        // tampilkan indikator loading jika pengambilan sedang berlangsung
        return CircularProgressIndicator();
      }
    }),
    backgroundColor: Color(0xffF1F1F1),
    automaticallyImplyLeading: false,
  );
  @override
  Widget build(BuildContext context) {
    final incolor = AppColors();
    final FittedFont fittedFont = new FittedFont(context);
    final heighMedia = MediaQuery.of(context).size.height -
        customMyAppbar.preferredSize.height;
    final widthMedia = MediaQuery.of(context).size.width;
    var headmedium = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      appBar: customMyAppbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(height: heighMedia * 0.03),
          Container(
              constraints: BoxConstraints(maxHeight: heighMedia * 0.24),
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: TextHelper(
                                text: 'Layanan Medis Cepat & Mudah',
                                fontSize: fittedFont.large,
                                fontFamily: 'nunito-b',
                                fontColor: Colors.white,
                              )),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: TextHelper(
                                text:
                                    'Kami menawarkan tenaga medis ahli untuk memberikan perawatan terbaik kepada anda',
                                fontSize: fittedFont.small,
                                fontColor: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(height: heighMedia * 0.03),
          Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 2.0,
                offset: Offset(0, 0.75),
              ),
            ], color: Colors.white),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextHelper(
                      text: "Layanan Kami",
                      fontSize: fittedFont.large,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Image.asset(
                                'assets/images/bayi_ic.png',
                                width: 80,
                              ),
                            ),
                            TextHelper(
                              text: 'Poli Ibu\nAnak',
                              fontSize: fittedFont.small,
                              textAlign: TextAlign.center,
                              fontFamily: 'nunito-m',
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ),
            // child: Container(
            //   // width: 50,
            //   // height: 50,
            //   color: Colors.red,
            //   child: Wrap(direction: Axis.vertical, children: [
            //     Container(
            //       color: Colors.green,
            //       // width: 4,
            //       // height: 95,
            //       child: Wrap(
            //         children: [
            //           Text('teset'),
            //           Container(
            //             height: 30,
            //             color: Colors.yellow,
            //             width: 5,
            //           )
            //           // Text('d\nd\nd\nd\nd\ndnsds\ndn\sn\sd\ns\dnsd\n')
            //         ],
            //       ),
            //     )
            //   ]),
            // ),
            // child: Wrap(direction: Axis.vertical, children: [
            //   TextHelper(
            //     text: "Layanan Kami",
            //     fontSize: fittedFont.large,
            //     fontFamily: 'nunito-m',
            //   ),
            //   Row(
            //     children: [
            //       Text("data"),
            //       Container(
            //         width: 50,
            //         height: 500,
            //         color: Colors.red,
            //       )
            //     ],
            //   )
            // ]),
          )
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   constraints: BoxConstraints(maxHeight: heighMedia * 0.32),
          //   decoration: BoxDecoration(boxShadow: <BoxShadow>[
          //     BoxShadow(
          //       color: incolor.cgrey,
          //       blurRadius: 2.0,
          //       offset: Offset(0, 0.75),
          //     ),
          //   ], color: Colors.white),
          //   child: Container(
          //     constraints: BoxConstraints(maxHeight: heighMedia),
          //     color: Colors.red,
          //     child: Wrap(
          //       direction: Axis.horizontal,
          //       children: [
          //         Container(
          //           alignment: Alignment.center,
          //           width: double.infinity,
          //           padding: const EdgeInsets.only(bottom: 8, top: 8),
          //           child: TextHelper(
          //               text: 'Layanan Kami', fontSize: fittedFont.large),
          //         ),
          //         Container(
          //           // constraints: BoxConstraints(maxHeight: heighMedia),
          //           // height: 100,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Container(
          //                 height: 500,
          //                 width: 6,
          //                 color: Colors.green,
          //                 // child: Wrap(
          //                 //   direction: Axis.vertical,
          //                 //   children: [
          //                 //     Padding(
          //                 //       padding: const EdgeInsets.only(bottom: 8),
          //                 //       child: Image.asset(
          //                 //         'assets/images/umum_ic.png',
          //                 //         width: widthMedia * 0.11,
          //                 //       ),
          //                 //     ),
          //                 //     TextHelper(
          //                 //       text: 'Pelayanan\nUmum',
          //                 //       fontSize: fittedFont.small,
          //                 //       textAlign: TextAlign.center,
          //                 //       overflow: TextOverflow.ellipsis,
          //                 //       fontFamily: 'nunito-m',
          //                 //     )
          //                 //   ],
          //                 // ),
          //               ),
          //               // Column(
          //               //   children: [
          //               //     Padding(
          //               //       padding: const EdgeInsets.only(bottom: 8),
          //               //       child: Image.asset(
          //               //         'assets/images/bayi_ic.png',
          //               //         width: widthMedia * 0.11,
          //               //       ),
          //               //     ),
          //               //     TextHelper(
          //               //       text: 'Poli Ibu\nAnak',
          //               //       fontSize: fittedFont.small,
          //               //       textAlign: TextAlign.center,
          //               //       fontFamily: 'nunito-m',
          //               //     ),
          //               //   ],
          //               // ),
          //               // Column(
          //               //   children: [
          //               //     Padding(
          //               //       padding: const EdgeInsets.only(bottom: 8),
          //               //       child: Image.asset(
          //               //         'assets/images/gigi_ic.png',
          //               //         width: widthMedia * 0.11,
          //               //       ),
          //               //     ),
          //               //     TextHelper(
          //               //       text: 'Poli Gigi',
          //               //       fontSize: fittedFont.small,
          //               //       textAlign: TextAlign.center,
          //               //       fontFamily: 'nunito-m',
          //               //     ),
          //               //   ],
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }
}
