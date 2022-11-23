import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';

import 'confirmation_page_api_service.dart';

class ConfirmationPageModel{
  final Box _box = Hive.box('RegistrationBox');
  final ConfirmationAPIService _confirmationAPIService = Get.find();
  final RegistrationPageController _registrationPageController = Get.find();


  registrationCompleted(){
    _box.put("registrationStatus", "completed");
    _box.put("tokenAt", _confirmationAPIService.tokenAt);
    _box.put("tokenRt", _confirmationAPIService.tokenRt);
    _box.put("name", _registrationPageController.nameFieldIsFilled);
    _box.put("phone", _registrationPageController.phoneFieldIsFilled);
    _box.put("email", _registrationPageController.emailFieldIsFilled);

    debugPrint("registrationStatus --> "+_box.get("registrationStatus"));
  }
}