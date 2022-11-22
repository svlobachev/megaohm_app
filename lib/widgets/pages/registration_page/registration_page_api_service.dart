import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_services/get_device_id.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';

 class RegistrationAPIService {
  RegistrationPageController registrationPageController = Get.find();
  Box box = Hive.box('RegistrationBox');
  GetDeviceId getDeviceId = Get.find();
  MyDioService myDioService = Get.find();

  String _clientID = '';
  String _nameFieldIsFilled = '';
  String _emailFieldIsFilled = '';
  String _phoneFieldIsFilled = '';
  String _token= '';

  String get token => _token;

  set token(String value) {
    _token = value;
    print("_token in registration --> $_token");
  }

  setValues() async {
    _clientID = getDeviceId.deviceId;
    _nameFieldIsFilled = registrationPageController.nameFieldIsFilled;
    _emailFieldIsFilled = registrationPageController.emailFieldIsFilled;
    _phoneFieldIsFilled = registrationPageController.phoneFieldIsFilled;
  }

  userRegistration() async {

    Map<String, dynamic> dataMap =
    await myDioService.floraAPI(path: '/auth', method: 'post', data: {
      "clientID": _clientID,
      "clientType": "flora_v1",
      "phone": _phoneFieldIsFilled,
      "email": _emailFieldIsFilled,
      "authType": "email"
    });
    for (var item in dataMap.entries) {
      if(item.key.trim() == "token") {
        _token = item.value.trim();
      }
      debugPrint("${item.key} - ${item.value}");
    }
  }
}
