import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'my_dio_service.dart';
import 'server_availability_check.dart';

class InternetCheck {
  final MySnackBarGet _mySnackBarGet = Get.find();
  final ServerAvailabilityCheck _serverAvailabilityCheck = Get.find();
  final MyDioService _myDioService = Get.find();
  // APIServersCall aPIServersCall = APIServersCall();
  // MyDioService myDioService = MyDioService();

  Future<bool> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("--> Нет соединения с интернетом!");
      _mySnackBarGet.mySnackBar(
        localizationName: 'noInternet',
        icon: const Icon(
          Icons.dangerous,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    } else {
      if (_myDioService.baseUrl.isEmpty) {
        _serverAvailabilityCheck.serversCalling();
      }
      return true;
    }
  }
}
