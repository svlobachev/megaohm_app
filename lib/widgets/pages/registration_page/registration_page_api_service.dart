import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/get_device_id.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class RegistrationAPIService {
  final RegistrationPageController _registrationPageController = Get.find();
  final GetDeviceId _getDeviceId = Get.find();
  final MyDioService _myDioService = Get.find();
  final MySnackBarGet _mySnackBarGet = Get.find();
  String token = '';

  Future<bool> userRegistration() async {
    String clientID = _getDeviceId.deviceId;
    // String nameFieldIsFilled = _registrationPageController.nameFieldIsFilled;
    String emailFieldIsFilled = _registrationPageController.emailFieldIsFilled;
    String phoneFieldIsFilled = _registrationPageController.phoneFieldIsFilled;
    Map<String, dynamic> dataMap =
        await _myDioService.floraAPI(path: '/auth', method: 'post', data: {
      "clientID": clientID,
      "clientType": "flora_v1",
      "phone": phoneFieldIsFilled,
      "email": emailFieldIsFilled,
      "authType": "email"
    });

    if (goodResponse(dataMap)) {
      return true;
    } else {
      responseWithErrors(dataMap);
      return false;
    }
  }

  bool goodResponse(dataMap) {
    for (var item in dataMap.entries) {
      debugPrint("${item.key} - ${item.value}");
      if (item.key.trim() == "token") {
        token = item.value.trim();
        return true;
      }
    }
    return false;
  }

  responseWithErrors(dataMap) {
    for (var item in dataMap.entries) {
      debugPrint("${item.key} - ${item.value}, ");
    }
    String _additionalText ="";
    // '400': 'Invalid request',
    // '401': 'Incorrect rt token',
    // '404': 'Client not found',
    // '422': 'Token already used',
    // '429': 'Too many request',
    // '500': 'Server error',
    switch (dataMap['responseStatusCode']) {
      case '400':
        _additionalText = dataMap['responseStatusCode']+": "+'400'.tr;
        break;
      case '401':
        _additionalText = dataMap['responseStatusCode']+": "+'401'.tr;
        break;
      case '404':
        _additionalText = dataMap['responseStatusCode']+": "+'404'.tr;
        break;
      case '422':
        _additionalText = dataMap['responseStatusCode']+": "+'422'.tr;
        break;
      case '429':
        _additionalText = dataMap['responseStatusCode']+": "+'429'.tr;
        break;
      case '500':
        _additionalText = dataMap['responseStatusCode']+": "+'500'.tr;
        break;
    }
    _mySnackBarGet.mySnackBar(
        text: _additionalText,
        icon: const Icon(
          Icons.dangerous,
          color: Colors.red,
          size: 30.0,
        ),
        duration: 7);
  }
}
