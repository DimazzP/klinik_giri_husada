import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/views/editalamat.dart';
import 'package:klinik_giri_husada/views/editnama.dart';
import 'package:klinik_giri_husada/views/editnik.dart';
import 'package:klinik_giri_husada/views/editnomor.dart';
import 'package:klinik_giri_husada/views/login.dart';

import '../controllers/AccountController.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late Future<ModelProfile> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = ModelProfile.getData(pasiend_id: "1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Akun Saya"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<ModelProfile>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Text(snapshot.data!.pasien_nama);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: snapshot.data!.pasien_gender == "L"
                      ? AssetImage('assets/images/lakik.png')
                      : AssetImage('assets/images/wedok.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 341,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text("${snapshot.data!.pasien_nama}",
                                      style: TextStyle(fontSize: 16)),
                                  IconButton(
                                      iconSize: 14,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditNama()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 25.0,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            height: 10,
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "NIK",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text("${snapshot.data!.pasien_nik}",
                                      style: TextStyle(fontSize: 16)),
                                  IconButton(
                                      iconSize: 14,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditNik()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 25.0,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            height: 10,
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No Telepon",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text("${snapshot.data!.pasien_nowa}",
                                      style: TextStyle(fontSize: 16)),
                                  IconButton(
                                      iconSize: 14,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditNomor()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 25.0,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            height: 10,
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Alamat",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text("${snapshot.data!.pasien_alamat}",
                                      style: TextStyle(fontSize: 16)),
                                  IconButton(
                                      iconSize: 14,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditAlamat()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 25.0,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            height: 10,
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showLogoutDialog(context);
                            },
                            child: Text(
                              "Log Out",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(16.0)))),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  showLogoutDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Anda yakin ingin keluar?",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          child: Text("Tidak"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Ya"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
