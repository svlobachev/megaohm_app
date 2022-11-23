import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class ConfirmationPageController {
  final MySnackBarGet _mySnackBarGet = Get.find();
  String codeFieldIsFilled = '';

  bool fieldValidation() {
    if (codeFieldIsFilled.isEmpty) {
      _mySnackBarGet.mySnackBar(
        localizationName: 'emptyField',
        icon: const Icon(
          Icons.text_fields,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    }
    if (codeFieldIsFilled.isNotEmpty) {
      final bool result =
      RegExp(r"[0-9]{6}")
          .hasMatch(codeFieldIsFilled.trim());
      if (kDebugMode) {
        // print("_codeFieldIsFilled --> $result");
      }
      if (!result) {
        _mySnackBarGet.mySnackBar(
          localizationName: 'pinIsIncorrect',
          icon: const Icon(
            Icons.text_fields,
            color: Colors.red,
            size: 30.0,
          ),
        );
        return false;
      }
        debugPrint("fieldValidation --> $result");

    }
    return true;
  }


}