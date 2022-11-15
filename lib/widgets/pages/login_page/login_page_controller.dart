import 'package:flutter/material.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class LoginPageController {
  MySnackBarGet mySnackBarGet = MySnackBarGet();

  String _isFilled = '';
  late bool _focusNodeField;

  bool get focusNodeField => _focusNodeField;

  set focusNodeField(bool value) {
    _focusNodeField = value;
    print("_focusNodeField --> $_focusNodeField");
  }

  set isFilled(value) {
    _isFilled = value;
    print("_isFilled --> $_isFilled");
  }

   checkFields() {
  }
  bool showsSnackBar() {
    if (!_focusNodeField && _isFilled.isNotEmpty) {
      return true;
    }  else if (!_focusNodeField && _isFilled.isEmpty) {
      mySnackBarGet.mySnackBar(
        'emptyField',
        const Icon(
          Icons.text_fields,
          color: Colors.red,
          size: 30.0,
        ),
      );
      return false;
    }
    return false;
  }
}
