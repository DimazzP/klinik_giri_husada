import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 3000), () {
      // Navigator.pushReplacementNamed(context, "/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              constraints: BoxConstraints(
                maxHeight: 60,
              ),
              child: Text(
                "Klinik Giri Husada",
                style: TextStyle(
                  fontSize: widthMedia * 0.05,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class _Splash extends State<Splashscreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
// }
