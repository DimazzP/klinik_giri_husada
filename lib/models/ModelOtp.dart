import 'package:http/http.dart' as http;

class ModelOtp {
  static void sendOtp(String nomoHp, String randomNumber) async {
    var token = "Rh8A_ZtcfAy8AEzZQLbY";
    var url = 'https://api.fonnte.com/send';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": token,
      },
      body: {
        'target': nomoHp,
        'message': "Kode Verifikasi Anda adalah $randomNumber",
      },
    );
    print(response.body);
  }
}
