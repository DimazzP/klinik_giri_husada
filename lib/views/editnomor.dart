import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/views/account.dart';

import '../controllers/AccountController.dart';
import '../controllers/UpdateNamaController.dart';

class EditNomor extends StatefulWidget {
  @override
  State<EditNomor> createState() => _EditNomor();
}

toos(BuildContext context) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    padding: EdgeInsets.all(16),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Nomor Anda Berhasil Di Ubah',
      message: 'Pastikan Anda Menuliskan Kata Sandi yang Benar :)',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AccountPage()),
  );
}

gagal(BuildContext context) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    padding: EdgeInsets.all(16),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Nomor Tidak Berhasil Di Ubah',
      message: 'Pastikan Anda Menuliskan Kata Sandi yang Benar :)',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditNomor()),
  );
}

bool _passwordVisible = true;
@override
void initState() {
  _passwordVisible = true;
}

class _EditNomor extends State<EditNomor> {
  TextEditingController nomor = TextEditingController();
  TextEditingController password = TextEditingController();
  late Future<ModelProfile> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = ModelProfile.getData(pasiend_id: "4");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ubah Nomor"),
        centerTitle: false,
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: FractionalOffset.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Ubah Nomor"),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.2)),
                            child: TextFormField(
                              controller: nomor,
                              //readOnly: true,

                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  hintText: "${snapshot.data?.pasien_nowa}",
                                  prefixIcon: Icon(Icons.person),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 13, 10, 7),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: FractionalOffset.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Masukan Password"),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.2)),
                            child: TextFormField(
                              controller: password,
                              //readOnly: true,

                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(_passwordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    color: Color.fromARGB(255, 143, 143, 143),
                                  ),
                                  suffixIconColor: Colors.black,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 13, 10, 7),
                                  border: InputBorder.none),
                              obscureText: _passwordVisible,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        print("n0mornya adalah ${nomor.text} ");
                        print("password == ${password.text}");
                        Update.ubahnomor(
                          idUser: '4',
                          nomorBaru: nomor.text,
                          chekPassowrd: password.text,
                        ).then((value) => {
                              if (value.code == "200")
                                {toos(context)}
                              else
                                {gagal(context)}
                            });
                      },
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }
}