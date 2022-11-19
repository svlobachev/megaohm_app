import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBarGet {
  mySnackBar({required String localizationName,required Icon icon}) {
    Get.snackbar(
      '',
      localizationName.tr,
      showProgressIndicator: true,
        icon: icon
    );
  }
}
