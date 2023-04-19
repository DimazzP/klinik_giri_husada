import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../helpers/colorThemes.dart';
import '../widgets/AppbarWidget.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({super.key});

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  DateTime _dateTime = DateTime.now();
  var myFormat;

  @override
  void initState() {
    // TODO: implement initState
    myFormat = "${_dateTime.day}-${_dateTime.month}-${_dateTime.year}";
    super.initState();
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );

  @override
  Widget build(BuildContext context) {
    final myAppbar =
        AppbarWidget(context: context, titleText: "Daftar Pelayanan");
    final appbarHeight = myAppbar.preferredSize.height;
    final heightMedia = MediaQuery.of(context).size.height - appbarHeight;
    final incolor = AppColors();
    return Scaffold(
      // appBar: AppbarWidget(headText: 'test'),
      appBar: myAppbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: heightMedia * 0.025),
                height: heightMedia * 0.3,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/gbdokter.png',
                  // height: 120,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                // height: heightMedia * 0.53,
                color: Colors.amber,
                child: Text('test'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Row(
//               children: [
//                 Expanded(
//                   child: Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: ElevatedButton.icon(
//                       onPressed: () async {
//                         final _date = await pickDate();
//                         if (_date == null) return;
//                         setState(() {
//                           _dateTime = _date;
//                         });
//                         // setState(() => _dateTime = _date);
//                       },
//                       icon: IconTheme(
//                         data: new IconThemeData(
//                           color: incolor.cprimary,
//                         ),
//                         child: Icon(Icons.calendar_month),
//                       ),
//                       label: Container(
//                           child: Row(children: [
//                         Expanded(
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}',
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     color: incolor.cgrey,
//                                   ),
//                                 ))),
//                       ])),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white),
//                     ),
//                   ),
//                 )
//               ],
//             )