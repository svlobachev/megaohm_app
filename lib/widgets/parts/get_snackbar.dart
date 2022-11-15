import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBarGet {
  mySnackBar(String localizationName,Icon icon) {
    Get.snackbar(
      '',
      // 'noInternet'.tr,
      localizationName.tr,
      showProgressIndicator: true,
        icon: icon
      // icon:  Icon(
      //   Icons.text_fields,
      //   color: Colors.red,
      //   size: 30.0,
      // ),
    );
  }
}
