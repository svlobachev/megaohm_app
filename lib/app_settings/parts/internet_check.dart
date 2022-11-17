import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class InternetCheck {
  MySnackBarGet mySnackBarGet = Get.find();
  Future<bool> initConnectivity() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("Нет соединения с интернетом!");
      mySnackBarGet.mySnackBar(
        'noInternet',
        const Icon(
          Icons.dangerous,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    } else  {
      return true;
    }
  }
}
