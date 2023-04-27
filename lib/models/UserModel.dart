import 'dart:convert';
import 'package:klinik_giri_husada/models/ErrorResponse.dart';

import '../helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

class UserModel {
  int? status;
  String? title;
  String? message;
  UserResponse? data;
  String? token;

  UserModel({this.status, this.title, this.message, this.data, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var myData = null;
    if (json['data'] != null) {
      myData = UserResponse.fromJson(json['data']);
    }

    return UserModel(
      status: json['status'],
      title: json['title'],
      message: json['message'],
      data: myData,
      token: json['token'] as String?,
    );
    // }
  }

  static Future<UserModel> login(
      String nowa, String sandi, String device_name) async {
    Uri url = Uri.parse(Apihelper.url + 'auth/login');
    var response = await http.post(url, body: {
      'user_nowa': nowa,
      'password': sandi,
      'device_name': device_name,
    });
    var userData = json.decode(response.body);
    return UserModel.fromJson(userData);
  }
}

class UserResponse {
  final int? user_id;
  final String? user_nowa;
  final int? user_idkategori;
  final ProfileResponse? profile;
  const UserResponse(
      {this.user_id, this.user_nowa, this.user_idkategori, this.profile});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user_id: json['user_id'],
      user_nowa: json['user_nowa'],
      user_idkategori: json['user_idkategori'],
      profile: ProfileResponse.fromJson(json['profile']),
    );
  }
}

class ProfileResponse {
  final int? pasien_id;
  final String? pasien_nama;
  final String? pasien_foto;
  final String? pasien_alamat;

  const ProfileResponse({
    this.pasien_id,
    this.pasien_nama,
    this.pasien_foto,
    this.pasien_alamat,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      pasien_id: json['pasien_id'],
      pasien_nama: json['pasien_nama'],
      pasien_foto: json['pasien_foto'],
      pasien_alamat: json['pasien_alamat'],
    );
  }
}
