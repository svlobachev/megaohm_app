import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';

import '../HTTP_Dio/server_availability_check.dart';

class BackgroundInternetCheck {
  final Box _box = Hive.box('FloraAPIBox');

  final ServerAvailabilityCheck _serverAvailabilityCheck =
      ServerAvailabilityCheck();
  int i = 0;
  // int _ii = 0;

  initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // _ii++;
      // debugPrint("--> Нет интернета! $_ii");
      _box.put('baseUrl', '');
      Future.delayed(const Duration(seconds: 1), () => initConnectivity());
    } else {
      i = 0;
      if (_box.get('baseUrl') == '') {
        // debugPrint("BackgroundInternetCheck_myDioService.baseUrl --> isEmpty");
        await _serverAvailabilityCheck.serversCalling();
      }
    }
  }
}
