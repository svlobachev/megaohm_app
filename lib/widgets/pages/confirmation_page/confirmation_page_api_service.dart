import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_api_service.dart';
import 'package:megaohm_app/widgets/parts/snackbar_with_erors.dart';

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
          debugPrint("newResendToken --> " + item.value.trim());
          return true;
        }
      }
      return false;
    }

    if (goodResponse(dataMap)) {
      return true;
    } else {
      responseWithErrors(dataMap);
      return false;
    }
  }


}
