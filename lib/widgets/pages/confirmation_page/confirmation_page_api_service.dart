import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_api_service.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'confirmation_page_controller.dart';

class ConfirmationAPIService {
  final RegistrationAPIService _registrationAPIService = Get.find();
  final ConfirmationPageController confirmationPageController = Get.find();
  final MyDioService _myDioService = Get.find();

  String _tokenRt = '';
  String _tokenAt = '';

  String get tokenRt => _tokenRt;

  String get tokenAt => _tokenAt;

  Future<bool> confirmUserRegistration() async {
    String token = _registrationAPIService.token;
    String code = confirmationPageController.codeFieldIsFilled;
    debugPrint("confirm_code --> $code");
    Map<String, dynamic> dataMap = await _myDioService
        .floraAPI(path: "/auth/$token", method: 'put', data: {"code": code});

    bool goodResponse(dataMap) {
      for (var item in dataMap.entries) {
        // debugPrint("${item.key} - ${item.value}");
        if (item.key.trim() == "rt") {
          _tokenRt = item.value.trim();
        } else if (item.key.trim() == "at") {
          _tokenAt = item.value.trim();
        }
      }
      if (_tokenRt.isNotEmpty && _tokenRt.isNotEmpty) {
        return true;
      }
      return false;
    }

    responseWithErrors(dataMap) {
      final MySnackBarGet _mySnackBarGet = Get.find();
      for (var item in dataMap.entries) {
        debugPrint("${item.key} - ${item.value}, ");
      }

      // '400':
      // description: 'Invalid request'
      // '401':
      // description: 'Incorrect session token'
      // '404':
      // description: 'Incorrect code'
      // '422':
      // description: 'Already confirmed'
      // '429':
      // description: 'Too many request'
      // '500':
      // description: 'Server error'

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
      if(dataMap.containsKey("DioError")) {
        _additionalText = 'serverNotReady'.tr;
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

    if (goodResponse(dataMap)) {
      return true;
    } else {
      responseWithErrors(dataMap);
      return false;
    }
  }

  Future<bool> codeResend() async {
    String token = _registrationAPIService.token;
    debugPrint("inputResendToken --> $token");
    Map<String, dynamic> dataMap = await _myDioService.floraAPI(
        path: "/auth/$token/resend", method: 'put', data: null);

    bool goodResponse(dataMap) {
      for (var item in dataMap.entries) {
        // debugPrint("${item.key} - ${item.value}");
        if (item.key.trim() == "token") {
          _registrationAPIService.token = item.value.trim();
          debugPrint("newResendToken --> ${item.value.trim()}");
          return true;
        }
      }
      return false;
    }

    responseWithErrors(dataMap) {
      final MySnackBarGet _mySnackBarGet = Get.find();
      for (var item in dataMap.entries) {
        debugPrint("${item.key} - ${item.value}, ");
      }

      // '400':
      // description: 'Invalid request'
      // '401':
      // description: 'Incorrect session token'
      // '408':
      // description: 'Previous code is not expired'
      // '422':
      // description: 'Already confirmed'
      // '429':
      // description: 'Too many request'
      // '500':
      // description: 'Server error'

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
      if(dataMap.containsKey("DioError")) {
        _additionalText = 'serverNotReady'.tr;
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

    if (goodResponse(dataMap)) {
      return true;
    } else {
      responseWithErrors(dataMap);
      return false;
    }
  }
}
