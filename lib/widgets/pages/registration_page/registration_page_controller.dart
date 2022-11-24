import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class RegistrationPageController {
  final MySnackBarGet _mySnackBarGet = Get.find();
  bool _isChecked = false;
  String _nameFieldIsFilled = '';
  String _emailFieldIsFilled = '';
  String _phoneFieldIsFilled = '';

  bool fieldValidation() {
    if (_nameFieldIsFilled.isEmpty ||
        _emailFieldIsFilled.isEmpty ||
        _phoneFieldIsFilled.isEmpty) {
      _mySnackBarGet.mySnackBar(
        localizationName: 'emptyField',
        icon: const Icon(
          Icons.text_fields,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    } else if (!_isChecked) {
      _mySnackBarGet.mySnackBar(
        localizationName: 'agreeToTheTerms',
        icon: const Icon(
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
        _mySnackBarGet.mySnackBar(
          localizationName: 'validName',
          icon: const Icon(
            Icons.text_fields,
            color: Colors.red,
            size: 30.0,
          ),
        );
        return false;
      }
    }
    if (_emailFieldIsFilled.isNotEmpty) {
      // final bool result = RegExp(
      //         r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      final bool result = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.([a-zA-Z]{2,})+")
              // r"/[A-Z0-9._%+-]+ @[A-Z0-9-]+. +.[A-Z]{2,4} / IGM+")
          .hasMatch(_emailFieldIsFilled.trim());
      // if (kDebugMode) {
      //   print("_emailFieldIsFilledValidation --> $result");
      // }
      if (!result) {
        _mySnackBarGet.mySnackBar(
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
      // final bool result =
      //     RegExp(r"^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$")
      final bool result =
          RegExp(r"^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$")
              .hasMatch(_phoneFieldIsFilled.trim());
      // if (kDebugMode) {
      //   print("_phoneFieldIsFilled --> $result");
      // }
      if (!result) {
        _mySnackBarGet.mySnackBar(
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

  set nameFieldIsFilled(String value) {
    _nameFieldIsFilled = value;
  }

  set isChecked(bool value) {
    _isChecked = value;
  }

  String get nameFieldIsFilled => _nameFieldIsFilled;

  String get emailFieldIsFilled => _emailFieldIsFilled;

  String get phoneFieldIsFilled => _phoneFieldIsFilled;
}
