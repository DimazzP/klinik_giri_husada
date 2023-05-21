import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/models/ModelEdit.dart';
import 'package:klinik_giri_husada/models/ModelToken.dart';
import 'package:klinik_giri_husada/models/UserModel.dart';
import 'package:klinik_giri_husada/views/login.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

import '../helpers/FontFamily.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserResponse? userData;

  void getUserData() async {
    // setState(() async {
    userData = await ModelToken.getUserData();
    setState(() {});
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        title: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Akun Saya',
                  style:
                      TextStyle(fontFamily: FontFamily.bold, fontSize: 20.sp),
                ),
              ),
            ),
            Container(),
          ],
        ),
        elevation: 0,
        backgroundColor: const Color(0xfff1f1f1),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              userData?.profile?.pasien_gender == 'P'
                  ? Image.asset(
                      'assets/images/womanavatar.png',
                      width: 120.w,
                      height: 120.h,
                    )
                  : Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.grey3),
                      child: Image.asset('assets/images/boyavatar.png'),
                    ),
              SizedBox(height: 34.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                    color: Colors.white),
                child: Column(children: [
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                              child: TextHelper(
                                  text: 'No Telp',
                                  fontSize: 16.sp,
                                  fontColor: AppColors.grey))),
                      Flexible(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: TextHelper(
                                        text: '${userData?.user_nowa}',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontColor: AppColors.black)),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.phone_android_sharp,
                                      color: AppColors.primary))
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 1,
                      width: double.infinity,
                      color: AppColors.grey2),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                              child: TextHelper(
                                  text: 'Nama',
                                  fontSize: 16.sp,
                                  fontColor: AppColors.grey))),
                      Flexible(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: TextHelper(
                                        text:
                                            '${userData?.profile?.pasien_nama.toString()}',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontColor: AppColors.black)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/edit_user',
                                        arguments: ModelEdit(
                                            valueCategory: 'Nama',
                                            myvalue: userData!
                                                .profile!.pasien_nama
                                                .toString(),
                                            idcategory: 1));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: AppColors.primary))
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 1,
                      width: double.infinity,
                      color: AppColors.grey2),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                              child: TextHelper(
                                  text: 'NIK',
                                  fontSize: 16.sp,
                                  fontColor: AppColors.grey))),
                      Flexible(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: TextHelper(
                                        text:
                                            '${userData?.profile?.pasien_nik}',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontColor: AppColors.black)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/edit_user',
                                        arguments: ModelEdit(
                                            valueCategory: 'NIK',
                                            myvalue: userData!
                                                .profile!.pasien_nik
                                                .toString(),
                                            idcategory: 2));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: AppColors.primary))
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 1,
                      width: double.infinity,
                      color: AppColors.grey2),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                              child: TextHelper(
                                  text: 'Kelamin',
                                  fontSize: 16.sp,
                                  fontColor: AppColors.grey))),
                      Flexible(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: TextHelper(
                                        text:
                                            userData?.profile?.pasien_gender ==
                                                    'L'
                                                ? 'Laki-laki'
                                                : 'Perempuan',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontColor: AppColors.black)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/change_gender',
                                        arguments:
                                            '${userData?.profile?.pasien_gender}');
                                  },
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: AppColors.primary))
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 1,
                      width: double.infinity,
                      color: AppColors.grey2),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                              child: TextHelper(
                                  text: 'Alamat',
                                  fontSize: 16.sp,
                                  fontColor: AppColors.grey))),
                      Flexible(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: TextHelper(
                                        text:
                                            '${userData?.profile?.pasien_alamat}',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontColor: AppColors.black)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/edit_user',
                                        arguments: ModelEdit(
                                            valueCategory: 'Alamat',
                                            myvalue: userData!
                                                .profile!.pasien_alamat
                                                .toString(),
                                            idcategory: 4));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: AppColors.primary))
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 1,
                      width: double.infinity,
                      color: AppColors.grey2),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                              child: TextHelper(
                                  text: 'Password',
                                  fontSize: 16.sp,
                                  fontColor: AppColors.grey))),
                      Flexible(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: TextHelper(
                                        text: '••••••',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontColor: AppColors.black)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/edit_password',
                                        arguments: ModelEdit(
                                            valueCategory: 'Alamat',
                                            myvalue: userData!
                                                .profile!.pasien_alamat
                                                .toString(),
                                            idcategory: 4));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: AppColors.primary))
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 1,
                      width: double.infinity,
                      color: AppColors.grey2),
                  SizedBox(height: 30.h),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              16.r), // Atur nilai sesuai kebutuhan
                        ),
                      ),
                      onPressed: () {
                        AwesomeWidget.infoDialog(context, 'Keluar',
                            'Apakah anda yakin untuk mengeluarkan akun dari perangkat anda?',
                            () async {
                          final storage = FlutterSecureStorage();
                          await storage.deleteAll();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (route) => false);
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        child: TextHelper(
                          text: 'Keluar',
                          fontSize: 20.sp,
                          fontColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
