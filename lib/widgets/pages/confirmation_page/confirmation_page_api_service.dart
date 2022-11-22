import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_api_service.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'confirmation_page_controller.dart';

class ConfirmationAPIService {
  final RegistrationAPIService _registrationAPIService = Get.find();
  final ConfirmationPageController confirmationPageController = Get.find();
  final MySnackBarGet _mySnackBarGet = Get.find();
  Box box = Hive.box('RegistrationBox');
  MyDioService myDioService = Get.find();

  String _tokenRt = '';
  String _tokenAt = '';

  String get tokenRt => _tokenRt;

  String get tokenAt => _tokenAt;

  Future<bool> confirmUserRegistration() async {
    var token = _registrationAPIService.token;
    var code = confirmationPageController.codeFieldIsFilled;
    debugPrint("confirm_code --> $code");
    Map<String, dynamic> dataMap = await myDioService
        .floraAPI(path: "/auth/$token", method: 'put', data: {"code": code});
    for (var item in dataMap.entries) {
      if (item.key.trim() == "rt") {
        _tokenRt = item.value.trim();
      } else if (item.key.trim() == "at") {
        _tokenAt = item.value.trim();
      } else if (item.key.trim() == "DioError") {
        _mySnackBarGet.mySnackBar(
          localizationName: 'pinIsIncorrect',
          icon: const Icon(
            Icons.password,
            color: Colors.red,
            size: 30.0,
          ),
        );
        return false;
      }
      debugPrint("${item.key} - ${item.value}");
    }
    if (_tokenRt.isNotEmpty && _tokenRt.isNotEmpty) {
      return true;
    }
    return false;
  }

  codeResend() {}

  accessTokenRenew() {}
}
