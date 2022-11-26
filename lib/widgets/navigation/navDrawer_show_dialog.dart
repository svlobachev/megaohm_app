import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:hive/hive.dart';

class NavDrawerShowDialog {
  final Box _box = Hive.box('RegistrationBox');

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: Text(
              "logOut".tr,
              style: const TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
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
                  _box.put('registrationStatus', '') ;
                  Get.offAllNamed("/");
              },
            ),
          ],
        );
      },
    );
  }
}
