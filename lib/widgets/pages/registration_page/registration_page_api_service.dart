import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/get_device_id.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';

 class RegistrationAPIService {
  final RegistrationPageController _registrationPageController = Get.find();
  final GetDeviceId _getDeviceId = Get.find();
  final MyDioService _myDioService = Get.find();

  String token= '';


  userRegistration() async {
    String clientID = _getDeviceId.deviceId;
    String nameFieldIsFilled = _registrationPageController.nameFieldIsFilled;
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
    for (var item in dataMap.entries) {
      if(item.key.trim() == "token") {
        token = item.value.trim();
      }
      debugPrint("${item.key} - ${item.value}");
    }
  }
}
