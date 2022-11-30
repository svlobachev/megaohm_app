import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/widgets/pages/registration_page/controller/registration_page_controller.dart';
import 'package:megaohm_app/widgets/pages/registration_page/service/registration_page_api_service.dart';
import '../service/confirmation_page_api_service.dart';
import '../controller/confirmation_page_controller.dart';

class ConfirmationPageModel {
  final Box _box = Hive.box('RegistrationBox');
  final ConfirmationAPIService _confirmationAPIService = Get.find();
  final RegistrationPageController _registrationPageController = Get.find();
  final RegistrationAPIService _registrationAPIService = Get.find();
  final ConfirmationPageController _confirmationPageController = Get.find();

  registrationCompleted() {
    _box.put("registrationStatus", "completed");
    _box.put("tokenAt", _confirmationAPIService.tokenAt);
    _box.put("tokenRt", _confirmationAPIService.tokenRt);
    _box.put("name", _registrationPageController.nameFieldIsFilled);
    _box.put("phone", _registrationPageController.phoneFieldIsFilled);
    _box.put("email", _registrationPageController.emailFieldIsFilled);

    _confirmationAPIService.tokenRt = '';
    _confirmationAPIService.tokenAt = '';
    _registrationAPIService.token = '';
    _confirmationPageController.codeFieldIsFilled = '';
    _registrationPageController.emailFieldIsFilled = '';
    _registrationPageController.phoneFieldIsFilled = '';
    _registrationPageController.nameFieldIsFilled = '';

    debugPrint("registrationStatus -->  ${_box.get("registrationStatus")}");
  }
}
