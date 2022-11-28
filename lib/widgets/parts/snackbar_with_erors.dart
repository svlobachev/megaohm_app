import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_snackbar.dart';

responseWithErrors(dataMap) {
  final MySnackBarGet mySnackBarGet = Get.find();
  for (var item in dataMap.entries) {
    debugPrint("${item.key} - ${item.value}, ");
  }
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
  if(dataMap.containsKey("DioError")) {
    additionalText = 'serviceNotReady'.tr;
  }
  mySnackBarGet.mySnackBar(
      text: additionalText,
      icon: const Icon(
        Icons.dangerous_outlined,
        color: Colors.red,
        size: 30.0,
      ),
      duration: 3);
}