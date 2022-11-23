import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class GetDeviceId {
  Uuid uuid = const Uuid();
  String _deviceId = '';

  String get deviceId => _deviceId;

  void getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      var androidID = uuid.v5(Uuid.NAMESPACE_URL, androidInfo.id);
        debugPrint('AndroidID --> $androidID');
 // e.g. "Moto G (4)"
      // _deviceId = androidID;
      _deviceId = uuid.v1();// Это только для теста
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (kDebugMode) {
        debugPrint('iosIdVendor --> ${iosInfo.identifierForVendor}');
      } // e.g. "iPod7,1"
      // _deviceId = iosInfo.identifierForVendor!;
      _deviceId = uuid.v1();// Это только для теста
    }
  }
}
