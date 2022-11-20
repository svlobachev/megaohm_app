import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'api_servs_call.dart';
import 'my_dio_service.dart';

class InternetCheck {
  MySnackBarGet mySnackBarGet = Get.find();
  ServerAvailabilityCheck serverAvailabilityCheck = Get.find();
  MyDioService myDioService = Get.find();
  // APIServersCall aPIServersCall = APIServersCall();
  // MyDioService myDioService = MyDioService();

  Future<bool> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("Нет соединения с интернетом!");
      mySnackBarGet.mySnackBar(
        localizationName: 'noInternet',
        icon: const Icon(
          Icons.dangerous,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    } else {
      if (myDioService.baseUrl.isEmpty) {
        serverAvailabilityCheck.serversCalling();
      }
      return true;
    }
  }
}
