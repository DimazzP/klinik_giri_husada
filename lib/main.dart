import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/helpers/pcolor.dart';
import 'package:klinik_giri_husada/views/account.dart';
import 'package:klinik_giri_husada/views/bottom_view.dart';
import 'package:klinik_giri_husada/views/editnama.dart';
import 'package:klinik_giri_husada/views/home.dart';
import 'package:klinik_giri_husada/views/login.dart';
import 'package:klinik_giri_husada/views/nomorantrian.dart';
import 'package:klinik_giri_husada/views/queue_message.dart';
import 'package:klinik_giri_husada/views/register.dart';
import 'package:klinik_giri_husada/views/splashscreen.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          color: Color(0xfff1f1f1),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: AppColors.primary,
              primarySwatch: Palette.pcolor,
              fontFamily: 'nunito-sm'),
          home: AccountPage(),
          routes: {
            '/splashscreen': (context) => Splashscreen(),
            '/login': (context) => const Login(),
            '/home': (context) => const HomePage(),
            '/queue': (context) => const QueuePage(),
            '/bottom_view': (context) => const BottomViews(),
            '/register': (context) => const Register(),
            '/account': (context) => const AccountPage(),
          },
        );
      },
    );
  }
}
