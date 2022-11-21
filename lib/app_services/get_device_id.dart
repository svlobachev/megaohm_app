import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class GetDeviceId {
  Uuid uuid = const Uuid();

  getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      var androidID = uuid.v5(Uuid.NAMESPACE_URL, androidInfo.id);
      if (kDebugMode) {
        print('AndroidID --> $androidID');
      } // e.g. "Moto G (4)"
      return androidID;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (kDebugMode) {
        print('iosIdVendor --> ${iosInfo.identifierForVendor}');
      } // e.g. "iPod7,1"
      return iosInfo.identifierForVendor;
    } else if (kIsWeb) {
      var webDeviceID = await deviceInfo.webBrowserInfo;
      if (kDebugMode) {
        print('webDeviceID --> ${deviceInfo.webBrowserInfo}');
      }
      return webDeviceID;
    }
  }
}
