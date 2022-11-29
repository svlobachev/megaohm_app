import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import '../HTTP_Dio/server_availability_check.dart';
import 'background_internet_check.dart';

class ClickInternetCheck {
  final Box _box = Hive.box('FloraAPIBox');
  final MySnackBarGet _mySnackBarGet = Get.find();
  final ServerAvailabilityCheck _serverAvailabilityCheck =
      ServerAvailabilityCheck();
  BackgroundInternetCheck backgroundInternetCheck = Get.find();

  Future<bool> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _mySnackBarGet.mySnackBar(
        text: 'noInternet'.tr,
        icon: const Icon(
          Icons.dangerous_outlined,
          color: Colors.redAccent,
          size: 30.0,
        ),
      );

      // debugPrint("--> Нет интернета!");
      _box.put('baseUrl', '');
      backgroundInternetCheck.i++;
      if (backgroundInternetCheck.i == 1) {
        backgroundInternetCheck.initConnectivity();
      }
      return false;
    } else {
      backgroundInternetCheck.i = 0;
      if (_box.get('baseUrl') == '') {
        await _serverAvailabilityCheck.serversCalling();
      }
      return true;
    }
  }
}
