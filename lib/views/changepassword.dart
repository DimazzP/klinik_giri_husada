import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _obscure = true;
  bool _obscure2 = true;

  void _toglePass2() {
    setState(() {
      _obscure2 = !_obscure2;
    });
  }

  void _toglePass() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Ubah Kata Sandi",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const Center(
                      child: Text(
                        "Masukkan password baru yang ingin anda",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // margin: EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Center(
                  child: Text(
                    "gunakan",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/lockpad.png",
                width: 120,
                height: 120,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 30),
                child: TextField(
                  obscureText: _obscure,
                  style: const TextStyle(fontSize: 14),
                  showCursor: false,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 218, 218, 218),
                    filled: true,
                    hintText: "Kata Sandi Baru",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _toglePass();
                        });
                      },
                      child: _obscure
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  obscureText: _obscure2,
                  style: const TextStyle(fontSize: 14),
                  showCursor: false,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 218, 218, 218),
                    filled: true,
                    hintText: "Konfirmasi Kata Sandi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _toglePass2();
                        });
                      },
                      child: _obscure2
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed('/donepw');
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
                  child: const Text(
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
