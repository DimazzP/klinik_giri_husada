import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';

class EditAlamat extends StatefulWidget {
  @override
  State<EditAlamat> createState() => _EditAlamat();
}

class _EditAlamat extends State<EditAlamat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ubah Alamat"),
        centerTitle: false,
      ),
      body: Column(
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
                child: Text("Ubah Alamat"),
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
                      //controller: email
                      //readOnly: true,

                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
