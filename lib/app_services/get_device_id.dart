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
      _deviceId = androidID;

      // _deviceId = uuid.v1();// Это только для теста
      // _deviceId = "39ba4339-8fdc-554b-b27b-46764f60b5c4";// Это только для теста
      // debugPrint('TestAndroidID --> $_deviceId');// Это только для теста
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        debugPrint('iosIdVendor --> ${iosInfo.identifierForVendor}');
      _deviceId = iosInfo.identifierForVendor!;

      // _deviceId = uuid.v1();// Это только для теста
      debugPrint('TestIosIdVendor --> ${iosInfo.identifierForVendor}');
    }
  }
}
