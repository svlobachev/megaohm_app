import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBarGet {
  mySnackBar({required String text,required Icon icon , int duration =3 }) {

    Get.snackbar(
      '',
      text,
      showProgressIndicator: true,
        icon: icon,
        duration: Duration(seconds: duration),
    );
  }
}
