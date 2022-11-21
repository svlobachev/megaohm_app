import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_dio_service.dart';
import 'server_availability_check.dart';

class BackgroundInternetCheck {
  final ServerAvailabilityCheck _serverAvailabilityCheck =
      ServerAvailabilityCheck();
  final MyDioService _myDioService = Get.find();
  initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("--> Нет соединения с интернетом!");
      _myDioService.baseUrl = '';
    } else {
      if (_myDioService.baseUrl.isEmpty) {
        _serverAvailabilityCheck.serversCalling();
      }
    }
    Future.delayed(
        const Duration(seconds: 3), () => initConnectivity());
  }
}
