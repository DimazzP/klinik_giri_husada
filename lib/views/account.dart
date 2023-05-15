import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Akun Saya",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
                  Image.asset(
                  "assets/images/ic_man.png",
                    width: 90,
                    height: 90,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Satria",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
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
