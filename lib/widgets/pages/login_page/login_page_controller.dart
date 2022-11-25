import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class LoginPageController {
  final MySnackBarGet _mySnackBarGet = Get.find();

  String _emailFieldIsFilled = '';
  String _phoneFieldIsFilled = '';

  bool fieldValidation() {
    if (
        _emailFieldIsFilled.isEmpty ||
        _phoneFieldIsFilled.isEmpty) {
      _mySnackBarGet.mySnackBar(
        text: 'emptyField'.tr,
        icon: const Icon(
          Icons.text_fields,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    }
    if (_emailFieldIsFilled.isNotEmpty) {
      final bool result = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailFieldIsFilled.trim());
      // if (kDebugMode) {
      //   print("_emailFieldIsFilledValidation --> $result");
      // }
      if (!result) {
        _mySnackBarGet.mySnackBar(
          text: 'validEmail'.tr,
          icon: const Icon(
            Icons.text_fields,
            color: Colors.red,
            size: 30.0,
          ),
        );
        return false;
      }
    }
    if (_phoneFieldIsFilled.isNotEmpty) {
      final bool result =
          RegExp(r"^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$")
              .hasMatch(_phoneFieldIsFilled.trim());
      // if (kDebugMode) {
      //   print("_phoneFieldIsFilled --> $result");
      // }
      if (!result) {
        _mySnackBarGet.mySnackBar(
          text: 'validPhone'.tr,
          icon: const Icon(
            Icons.text_fields,
            color: Colors.red,
            size: 30.0,
          ),
        );
        return false;
      }
    }
    return true;
  }

  set phoneFieldIsFilled(String value) {
    _phoneFieldIsFilled = value;
  }

  set emailFieldIsFilled(String value) {
    _emailFieldIsFilled = value;
  }

  String get emailFieldIsFilled => _emailFieldIsFilled;

  String get phoneFieldIsFilled => _phoneFieldIsFilled;
}
