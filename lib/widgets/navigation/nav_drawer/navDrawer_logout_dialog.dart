import "package:flutter/material.dart";
import "package:get/get.dart";

import 'navDrawer_logout_dialog_model.dart';

class NavDrawerShowDialog {
  final NavDrawerShowDialogModel _navDrawerShowDialogModel = Get.find();
  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "logOut".tr,
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
                "cancel".tr,
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
                "goOut".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
              onPressed: () async {
                _navDrawerShowDialogModel.dropRegistrationData();
                  Get.offAllNamed("/");
              },
            ),
          ],
        );
      },
    );
  }
}
