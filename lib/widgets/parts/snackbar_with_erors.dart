import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_snackbar.dart';

responseWithErrors(dataMap) {
  final MySnackBarGet _mySnackBarGet = Get.find();
  for (var item in dataMap.entries) {
    debugPrint("${item.key} - ${item.value}, ");
  }
  String _additionalText = "";
  switch (dataMap['responseStatusCode']) {
    case '400':
      _additionalText = dataMap['responseStatusCode'] + ": " + '400'.tr;
      break;
    case '401':
      _additionalText = dataMap['responseStatusCode'] + ": " + '401'.tr;
      break;
    case '404':
      _additionalText = dataMap['responseStatusCode'] + ": " + '404'.tr;
      break;
    case '422':
      _additionalText = dataMap['responseStatusCode'] + ": " + '422'.tr;
      break;
    case '429':
      _additionalText = dataMap['responseStatusCode'] + ": " + '429'.tr;
      break;
    case '500':
      _additionalText = dataMap['responseStatusCode'] + ": " + '500'.tr;
      break;
  }
  _mySnackBarGet.mySnackBar(
      text: _additionalText,
      icon: const Icon(
        Icons.dangerous,
        color: Colors.red,
        size: 30.0,
      ),
      duration: 3);
}