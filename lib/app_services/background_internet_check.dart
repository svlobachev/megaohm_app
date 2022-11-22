import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_dio_service.dart';
import 'server_availability_check.dart';

class BackgroundInternetCheck {

  final ServerAvailabilityCheck _serverAvailabilityCheck =
      ServerAvailabilityCheck();
  final MyDioService _myDioService = Get.find();
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
      _myDioService.baseUrl = '';
      Future.delayed(
          const Duration(seconds: 1), () => initConnectivity());
    } else {
      i = 0;
      if (_myDioService.baseUrl.isEmpty) {
        _serverAvailabilityCheck.serversCalling();
      }
    }

  }
}
