// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';

// class DeviceInfo {
//   static Future<String> getInfo(BuildContext context) async {
//     final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     String? deviceName = '';

//     if (Theme.of(context).platform == TargetPlatform.iOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceName = iosInfo.name;
//     } else if (Theme.of(context).platform == TargetPlatform.windows) {
//       WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
//       deviceName = windowsInfo.deviceId;
//     } else {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceName = androidInfo.model;
//     }

//     return deviceName!;
//   }
// }
