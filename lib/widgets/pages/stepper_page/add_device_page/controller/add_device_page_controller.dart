import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class AddDeviceController {
  final ForAllForms _forAllForms = Get.find();
  final MySnackBarGet _mySnackBarGet = Get.find();

  String SSIDFieldIsFilled = '';
  String PSWRDFieldIsFilled = '';

  bool fieldValidation() {
    if (SSIDFieldIsFilled.isEmpty || PSWRDFieldIsFilled.isEmpty) {
      _mySnackBarGet.mySnackBar(
        text: 'emptyField'.tr,
        icon: Icon(
          Icons.text_fields,
          color: _forAllForms.colorForSnackBarIcons,
          size: 30.0,
        ),
      );
      return false;
    }
    // if (SSIDFieldIsFilled.isNotEmpty) {
    //   final bool result =
    //       RegExp(r"^[0-9A-F]{24}$").hasMatch(SSIDFieldIsFilled.trim());
    //   if (!result) {
    //     _mySnackBarGet.mySnackBar(
    //       text: 'SSID ${'404'.tr}',
    //       icon: Icon(
    //         Icons.text_fields,
    //         color: _forAllForms.colorForSnackBarIcons,
    //         size: 30.0,
    //       ),
    //     );
    //     return false;
    //   }
    //   // debugPrint("SSIDFieldIsFilled --> $result");
    // }
    // if (PSWRDFieldIsFilled.isNotEmpty) {
    //   final bool result =
    //       RegExp(r"^[0-9]\.[0-9]\.[0-9]$").hasMatch(PSWRDFieldIsFilled.trim());
    //   if (!result) {
    //     _mySnackBarGet.mySnackBar(
    //       text: 'PSWRD ${'404'.tr}',
    //       icon: Icon(
    //         Icons.text_fields,
    //         color: _forAllForms.colorForSnackBarIcons,
    //         size: 30.0,
    //       ),
    //     );
    //     return false;
    //   }
    //   // debugPrint("PSWRDFieldIsFilled --> $result");
    // }
    return true;
  }
}
