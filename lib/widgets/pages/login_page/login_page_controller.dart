import 'package:flutter/material.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class LoginPageController {
  MySnackBarGet mySnackBarGet = MySnackBarGet();

  String _emailFieldIsFilled = '';
  String _phoneFieldIsFilled = '';

  bool fieldValidation() {
    if (
        _emailFieldIsFilled.isEmpty ||
        _phoneFieldIsFilled.isEmpty) {
      mySnackBarGet.mySnackBar(
        localizationName: 'emptyField',
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
        mySnackBarGet.mySnackBar(
          localizationName: 'validEmail',
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
        mySnackBarGet.mySnackBar(
          localizationName: 'validPhone',
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
