import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'server_availability_check.dart';

class BackgroundInternetCheck {
  final Box _box = Hive.box('RegistrationBox');
  final ServerAvailabilityCheck _serverAvailabilityCheck =
      ServerAvailabilityCheck();
  int _i = 0;
  int _ii = 0;

  int get i => _i;

  set i(int value) {
    _i = value;
    // debugPrint(_i.toString());
  }

  initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _ii++;
      debugPrint("--> Нет соединения с интернетом! $_ii");
      _box.put('baseUrl', '');
      Future.delayed(
          const Duration(seconds: 1), () => initConnectivity());
    } else {
      i = 0;
      if (_box.get('baseUrl') == '') {
        // debugPrint("BackgroundInternetCheck_myDioService.baseUrl --> isEmpty");
        _serverAvailabilityCheck.serversCalling();
      }
    }

  }
}
