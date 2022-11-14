import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class InternetCheck {
  Future<bool> initConnectivity() async {
    var result = Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      debugPrint("Нет соединения с интернетом!");
      snackBar();
      return false;
    } else {
      // snackBar();
      return true;
    }
  }

  snackBar() {
    Get.snackbar(
      '',
      'noInternet'.tr,
      showProgressIndicator: true,
      icon: const Icon(
        Icons.dangerous,
        color: Colors.red,
        size: 30.0,
      ),
    );
  }
}
