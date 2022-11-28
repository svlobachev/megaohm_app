import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/widgets/parts/snackbar_with_erors.dart';

class AccessTokenRenew {
  final Box _box = Hive.box('RegistrationBox');
  final MyDioService _myDioService = Get.find();

  String _tokenRt = '';
  String _tokenAt = '';

  String get tokenRt => _tokenRt;

  String get tokenAt => _tokenAt;

  Future<bool> accessTokenRenew() async {
    if (_box.containsKey('tokenRt')) {
      _tokenRt = _box.get("tokenRt");
    } else {
      return false;
    }
    if (_box.containsKey('tokenAt') ) {
      _tokenAt = _box.get("tokenAt");
    } else {
      return false;
    }

    Map<String, dynamic> dataMap = await _myDioService
        .floraAPI(path: "/auth/renew", method: 'put', data: {"rt": _tokenRt});

    bool goodResponse(dataMap) {
      // for (var item in dataMap.entries) {
      //   debugPrint("${item.key} - ${item.value}");
      // }
      for (var item in dataMap.entries) {
        if (item.key.trim() == "rt") {
          _tokenRt = item.value.trim();
          _box.put("tokenRt", _tokenRt);
            DateTime decodedTokenRtDateTime = JwtDecoder.getExpirationDate(_tokenRt);
            debugPrint("tokenRtdata --> $decodedTokenRtDateTime");
        } else if (item.key.trim() == "at") {
          _tokenAt = item.value.trim();
          _box.put("tokenAt", _tokenAt);
          DateTime decodedTokenAtDateTime = JwtDecoder.getExpirationDate(_tokenAt);
          debugPrint("tokenAtdata --> $decodedTokenAtDateTime");
        }
      }
      if (_tokenRt.isNotEmpty && _tokenRt.isNotEmpty) {
        return true;
      }
      return false;
    }

    if (goodResponse(dataMap)) {
      return true;
    } else {
      responseWithErrors(dataMap);
      return false;
    }
  }
}
