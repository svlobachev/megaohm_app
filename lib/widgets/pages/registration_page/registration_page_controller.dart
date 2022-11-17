import 'package:flutter/material.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class RegistrationPageController {
  MySnackBarGet mySnackBarGet = MySnackBarGet();
  bool _isChecked = false;
  String _nameFieldIsFilled = '';
  String _emailFieldIsFilled = '';
  String _phoneFieldIsFilled = '';

  bool checkFields() {
    if (_nameFieldIsFilled.isEmpty ||
        _emailFieldIsFilled.isEmpty ||
        _phoneFieldIsFilled.isEmpty) {
      mySnackBarGet.mySnackBar(
        'emptyField',
        const Icon(
          Icons.text_fields,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    } else if (!_isChecked) {
      mySnackBarGet.mySnackBar(
        'agreeToTheTerms',
        const Icon(
          Icons.text_fields,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    }
    if (_nameFieldIsFilled.isNotEmpty) {
      final bool result =
          RegExp(r"^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$")
              .hasMatch(_nameFieldIsFilled.trim());
      // if (kDebugMode) {
      //   print("_nameFieldIsFilledValidation --> $result");
      // }
      if (!result) {
        mySnackBarGet.mySnackBar(
          'validName',
          const Icon(
            Icons.text_fields,
            color: Colors.red,
            size: 30.0,
          ),
        );
        return false;
      }
    }
    if (_emailFieldIsFilled.isNotEmpty) {
      final bool result = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
      )
          .hasMatch(_emailFieldIsFilled.trim());
      // if (kDebugMode) {
      //   print("_emailFieldIsFilledValidation --> $result");
      // }
      if (!result) {
        mySnackBarGet.mySnackBar(
          'validEmail',
          const Icon(
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
          'validPhone',
          const Icon(
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

  set nameFieldIsFilled(String value) {
    _nameFieldIsFilled = value;
  }

  set isChecked(bool value) {
    _isChecked = value;
  }
}
