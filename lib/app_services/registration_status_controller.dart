import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RegistrationStatusController {
  final _box = Hive.box('RegistrationBox');
  String _tokenRt = '';
  String _tokenAt = '';
  bool registrationControl() {

    if (_box.containsKey('tokenRt')){
       _tokenRt = _box.get("tokenRt");
    }

    if (_box.containsKey('tokenAt')){
      _tokenRt = _box.get("tokenAt");
    }

    DateTime dateTimeNow = (DateTime.now());

    if (_box.containsKey('tokenRt') && _tokenRt != '') {
      DateTime decodedTokenRtDateTime = JwtDecoder.getExpirationDate(_tokenRt);
      debugPrint("tokenRtdata --> $decodedTokenRtDateTime");
      if (decodedTokenRtDateTime.microsecond > dateTimeNow.microsecond) {
        return false;
      }
    }

    if (_box.containsKey('tokenAt') && _tokenAt != '') {
      DateTime decodedTokenAtDateTime = JwtDecoder.getExpirationDate(_tokenAt);
      debugPrint("tokenAtdata --> $decodedTokenAtDateTime");
    }

    if (_box.containsKey('registrationStatus') &&
        _box.get('registrationStatus') == 'completed') {
      return true;
    }
    return false;
  }
}
