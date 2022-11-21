import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'my_dio_service.dart';
import 'server_availability_check.dart';

class ClickInternetCheck {
  final MySnackBarGet _mySnackBarGet = Get.find();
  final ServerAvailabilityCheck _serverAvailabilityCheck = ServerAvailabilityCheck();
  final MyDioService _myDioService = Get.find();

  Future<bool> initConnectivity() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      try {
      _mySnackBarGet.mySnackBar(
        localizationName: 'noInternet',
        icon: const Icon(
          Icons.dangerous,
          color: Colors.red,
          size: 30.0,
        ),
      );
    }catch(e){
        if (kDebugMode) {
          print(e);
        }
      }
      debugPrint("--> Нет соединения с интернетом!");
      _myDioService.baseUrl = '';
      return false;
    } else {
      if (_myDioService.baseUrl.isEmpty) {
        _serverAvailabilityCheck.serversCalling();
      }
      return true;
    }
  }
}
