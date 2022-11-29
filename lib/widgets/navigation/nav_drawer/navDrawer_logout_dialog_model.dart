import 'package:hive/hive.dart';

class NavDrawerShowDialogModel {
  final Box _box = Hive.box('RegistrationBox');
  // final ConfirmationAPIService _confirmationAPIService = Get.find();
  // final ConfirmationPageController _confirmationPageController = Get.find();
  // final RegistrationPageController _registrationPageController = Get.find();
  // final RegistrationAPIService _registrationAPIService = Get.find();

  dropRegistrationData() {
    _box.put('registrationStatus', '');
    _box.put('tokenAt', '');
    _box.put('tokenRt', '');
    _box.put('phone', '');
    _box.put('email', '');

    // _confirmationAPIService.tokenRt = '';
    // _confirmationAPIService.tokenAt = '';
    // _registrationAPIService.token = '';
    // _confirmationPageController.codeFieldIsFilled = '';
    // _registrationPageController.emailFieldIsFilled = '';
    // _registrationPageController.phoneFieldIsFilled = '';
    // _registrationPageController.nameFieldIsFilled = '';
  }
}
