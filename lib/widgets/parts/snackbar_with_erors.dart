import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';

import 'get_snackbar.dart';

responseWithErrors(dataMap) {
  final MySnackBarGet mySnackBarGet = Get.find();
  final ForAllForms _forAllForms = Get.find();
  String additionalText = "";
  switch (dataMap['responseStatusCode']) {
    case '400':
      additionalText = dataMap['responseStatusCode'] + ": " + '400'.tr;
      break;
    case '401':
      additionalText = dataMap['responseStatusCode'] + ": " + '401'.tr;
      break;
    case '404':
      additionalText = dataMap['responseStatusCode'] + ": " + '404'.tr;
      break;
    case '422':
      additionalText = dataMap['responseStatusCode'] + ": " + '422'.tr;
      break;
    case '429':
      additionalText = dataMap['responseStatusCode'] + ": " + '429'.tr;
      break;
    case '500':
      additionalText = dataMap['responseStatusCode'] + ": " + '500'.tr;
      break;
  }

  if (dataMap.containsKey("DioError")) {
    additionalText = 'serviceNotReady'.tr;
  }

  if (dataMap['responseStatusCode'] != '200') {
    mySnackBarGet.mySnackBar(
        text: additionalText,
        icon: Icon(
          Icons.warning_amber_rounded,
          color: _forAllForms.colorForSnackBarIcons,
          size: 30.0,
        ),
        duration: 3);
  }
}
