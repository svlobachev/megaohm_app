import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import '../HTTP_Dio/server_availability_check.dart';
import 'background_internet_check.dart';

class ClickInternetCheck {
  final Box _box = Hive.box('RegistrationBox');
  final MySnackBarGet _mySnackBarGet = Get.find();
  final ServerAvailabilityCheck _serverAvailabilityCheck =
      ServerAvailabilityCheck();
  BackgroundInternetCheck backgroundInternetCheck = Get.find();

  Future<bool> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      try {
        _mySnackBarGet.mySnackBar(
          text: 'noInternet'.tr,
          icon: const Icon(
            Icons.dangerous,
            color: Colors.red,
            size: 30.0,
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      debugPrint("--> Нет соединения с интернетом!");
      _box.put('baseUrl', '');
      backgroundInternetCheck.i++;
      if (backgroundInternetCheck.i == 1) {
        backgroundInternetCheck.initConnectivity();
      }
      return false;
    } else {
      backgroundInternetCheck.i = 0;
      if (_box.get('baseUrl') == '') {
         // debugPrint("ClickInternetCheck_myDioService.baseUrl --> isEmpty");
        _serverAvailabilityCheck.serversCalling();
      }
      return true;
    }
  }
}
