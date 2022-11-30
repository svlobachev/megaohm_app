import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:megaohm_app/widgets/pages/registration_page/controller/registration_page_controller.dart';
import 'package:megaohm_app/widgets/pages/registration_page/service/registration_page_api_service.dart';

class ShowDialog {
  final RegistrationAPIService _registrationAPIService = Get.find();
  final RegistrationPageController _registrationPageController = Get.find();
  String _nameFieldIsFilled = '';
  String _emailFieldIsFilled = '';
  String _phoneFieldIsFilled = '';

  Future<void> dialogBuilder(BuildContext context) {
    _nameFieldIsFilled = _registrationPageController.nameFieldIsFilled;
    _emailFieldIsFilled = _registrationPageController.emailFieldIsFilled;
    _phoneFieldIsFilled = _registrationPageController.phoneFieldIsFilled;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("yourData".tr),
          content: Text(
            "${"yourName".tr}: $_nameFieldIsFilled\n\n${"Email".tr}: $_emailFieldIsFilled\n\n${"PhoneNumber".tr}: $_phoneFieldIsFilled\n",
            style: const TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                "change".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                "doRegistrationLowerCase".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
              onPressed: () async {
                if (await _registrationAPIService.userRegistration()) {
                  Get.offAllNamed("/conformation");
                }
              },
            ),
          ],
        );
      },
    );
  }
}
