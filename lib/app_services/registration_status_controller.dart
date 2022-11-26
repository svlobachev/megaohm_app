import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RegistrationStatusController {
  final _box = Hive.box('RegistrationBox');

  bool registrationControl() {
    String tokenRt = _box.get("tokenRt");
    String tokenAt = _box.get("tokenAt");
    DateTime dateTimeNow = (DateTime.now());

    if (tokenRt != '') {
      DateTime decodedTokenRtDateTime = JwtDecoder.getExpirationDate(tokenRt);
      debugPrint("tokenRtdata --> $decodedTokenRtDateTime");
      if (decodedTokenRtDateTime.microsecond > dateTimeNow.microsecond) {
        return false;
      }
    }

    if (tokenAt != '') {
      DateTime decodedTokenAtDateTime = JwtDecoder.getExpirationDate(tokenAt);
      debugPrint("tokenAtdata --> $decodedTokenAtDateTime");
    }

    if (_box.containsKey('registrationStatus') &&
        _box.get('registrationStatus') == 'completed') {
      return true;
    }
    return false;
  }
}
