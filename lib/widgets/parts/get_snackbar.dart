import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBarGet {

  SnackbarStatus? _snackBarStatus = SnackbarStatus.CLOSED;

   mySnackBar ({required String text, required Icon icon, int duration = 3}) {
    if (_snackBarStatus == SnackbarStatus.CLOSED) {
      Get.snackbar(
        '',
        text,
        showProgressIndicator: true,
        shouldIconPulse: false,
        icon: icon,
        snackbarStatus: (value) {
          _snackBarStatus = value;
        },
        duration: Duration(seconds: duration),
      );
    }
  }
}
