import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/services.dart';

class DonePassword extends StatefulWidget {
  const DonePassword({super.key});

  @override
  State<DonePassword> createState() => _DonePasswordState();
}

class _DonePasswordState extends State<DonePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              // Container(
              //   child: Text(
              //     "Ubah Kata Sandi Berhasil",
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              //   ),
              // ),
              SizedBox(
                height: 120,
              ),
              Image.asset(
                "assets/images/check.png",
                height: 130,
                width: 130,
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Ubah Kata Sandi Berhasil!",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Text(
                    "Anda akan diarahkan kembali ke halaman",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Text(
                    "login",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                margin: EdgeInsets.only(top: 60),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
                  child: Text(
                    "Ubah Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
