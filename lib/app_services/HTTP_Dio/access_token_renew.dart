import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

class AccessTokenRenew {
  final Box _box = Hive.box('RegistrationBox');
  final MyDioService _myDioService = Get.find();

  String _tokenRt = '';
  String _tokenAt = '';

  String get tokenRt => _tokenRt;

  String get tokenAt => _tokenAt;

  accessTokenRenew() async {
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
        } else if (item.key.trim() == "at") {
          _tokenAt = item.value.trim();
          _box.put("tokenAt", _tokenAt);
        }
      }
      if (_tokenRt.isNotEmpty && _tokenRt.isNotEmpty) {
        return true;
      }
      return false;
    }

    responseWithErrors(dataMap) {
      final MySnackBarGet _mySnackBarGet = Get.find();
      for (var item in dataMap.entries) {
        debugPrint("${item.key} - ${item.value}, ");
      }

      // '400':
      // description: 'Invalid request'
      // '401':
      // description: 'Incorrect rt token'
      // '404':
      // description: 'Client not found'
      // '422':
      // description: 'Token already used'
      // '429':
      // description: 'Too many request'
      // '500':
      // description: 'Server error'

      String _additionalText = "";
      switch (dataMap['responseStatusCode']) {
        case '400':
          _additionalText = dataMap['responseStatusCode'] + ": " + '400'.tr;
          break;
        case '401':
          _additionalText = dataMap['responseStatusCode'] + ": " + '401'.tr;
          break;
        case '404':
          _additionalText = dataMap['responseStatusCode'] + ": " + '404'.tr;
          break;
        case '422':
          _additionalText = dataMap['responseStatusCode'] + ": " + '422'.tr;
          break;
        case '429':
          _additionalText = dataMap['responseStatusCode'] + ": " + '429'.tr;
          break;
        case '500':
          _additionalText = dataMap['responseStatusCode'] + ": " + '500'.tr;
          break;
      }
      if(dataMap.containsKey("DioError")) {
        _additionalText = 'serverNotReady'.tr;
      }
      _mySnackBarGet.mySnackBar(
          text: _additionalText,
          icon: const Icon(
            Icons.dangerous,
            color: Colors.red,
            size: 30.0,
          ),
          duration: 3);
    }

    if (goodResponse(dataMap)) {
      return true;
    } else {
      responseWithErrors(dataMap);
      return false;
    }
  }
}
