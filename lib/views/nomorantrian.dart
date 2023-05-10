import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/controllers/AntrianNomor.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketAntrian extends StatefulWidget {
  @override
  State<TicketAntrian> createState() => _TicketAntrianState();
}

class _TicketAntrianState extends State<TicketAntrian> {
  late Future<ModelAntrian> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data =
        ModelAntrian.getData(daftar_nomor: "1", daftar_tanggal: "2023-05-10");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 231, 232),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 231, 231, 232),
        centerTitle: true,
        title: Text(
          'Nomor Antrian Anda',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<ModelAntrian>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data!.pasien_nama);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return ListView(
                  children: [
                    Center(
                      child: TicketWidget(
                        width: 350,
                        height: 580,
                        isCornerRounded: true,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${snapshot.data!.jenis_layanan}",
                              style: TextStyle(fontSize: 24.0),
                            ),
                            Text(
                              "Pendaftaran Jenis Layanan Umum",
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "${snapshot.data!.daftar_nomor}",
                              style: TextStyle(fontSize: 80.0),
                            ),
                            Text(
                              "NOMOR ANTRIAN",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "${snapshot.data!.daftar_status}",
                              style: TextStyle(color: AppColors.primary),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.people),
                              title: Text(
                                "Nama Pasien",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              subtitle: Text(
                                "${snapshot.data!.pasien_nama}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.calendar_today),
                              title: Text("Tanggal",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              subtitle: Text("${snapshot.data!.daftar_tanggal}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                            ),
                            ListTile(
                              leading: Icon(Icons.people),
                              title: Text("Jumlah Antrian",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              subtitle: Text(
                                  "${snapshot.data!.daftar_nomor}/32",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                            ),
                            ListTile(
                              leading: Icon(Icons.people),
                              title: Text("Nama Dokter",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              subtitle: Text("${snapshot.data!.pekerja_nama}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Kembali",
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
              })),
    );
  }
}
