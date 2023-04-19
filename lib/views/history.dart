import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../helpers/colorThemes.dart';
import '../models/PatientModel.dart';
import '../widgets/AppbarWidget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<DataPatient> data = [];

  @override
  void initState() {
    // TODO: implement initState
    PatientModel.tampil().then((value) {
      // print(value.kode);
      setState(() {
        data = value.data!;
      });
      // print(value.data![0].pasien_nama);
      // print(data[0].pasien_nowa);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myAppbar =
        AppbarWidget(context: context, titleText: "Riwayat Pesaan");
    final appbarHeight = myAppbar.preferredSize.height;
    final heightMedia = MediaQuery.of(context).size.height - appbarHeight;
    final incolor = AppColors();
    return Scaffold(
      appBar: myAppbar,
      body: ListView.builder(
        itemBuilder: (context, index) {
          DataPatient dp = data![index];
          return Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  )
                ]),
            child: ListTile(
              title: Text(data[index].pasien_nama.toString()),
              subtitle: Text(data[index].pasien_nowa.toString()),
              isThreeLine: true,
              // dense: ,
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
