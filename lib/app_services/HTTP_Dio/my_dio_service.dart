import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyDioService {
  final Box _box = Hive.box('FloraAPIBox');

  Future<Map<String, dynamic>> floraAPI(
      {required String path,
      required String method,
      required Map<String, String> data,
      int timeoutSec = 10}) async {
    Map<String, dynamic> dataMap = {};
    var baseUrl = _box.get("baseUrl");
    String responseStatusCode = '';

    if (_box.containsKey("floraAPIStatus") &&
        _box.get("floraAPIStatus") == 'locked') {
      return dataMap = {"responseStatusCode": '429'};
    }

    _box.put("floraAPIStatus", 'locked');
    var dio = Dio();
    // if (baseUrl.isNotEmpty) debugPrint("floraAPI_baseUrl --> $baseUrl");
    dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = 3000 //3s
      ..receiveTimeout = timeoutSec * 1000
      ..validateStatus = (int? status) {
        responseStatusCode = status.toString();
        return status != null && status > 0;
      }
      ..headers = {
        HttpHeaders.userAgentHeader: 'dio',
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      };

    if (method == 'post') {
      try {
        var response = await dio.post(
          path,
          data: data,
          options: Options(
            contentType: Headers.jsonContentType,
          ),
        );
        response.data.isNotEmpty
            ? dataMap = json.decode(response.toString())
            : null;
      } on DioError catch (e) {
        dataMap["DioError"] = e.message;
      }
    } else if (method == 'put') {
      try {
        var response = await dio.put(
          path,
          data: data,
          options: Options(
            contentType: Headers.jsonContentType,
          ),
        );
        response.data.isNotEmpty
            ? dataMap = json.decode(response.toString())
            : null;
      } on DioError catch (e) {
        dataMap["DioError"] = e.message;
      }
    }
    dataMap["responseStatusCode"] = responseStatusCode;
    for (var item in dataMap.entries) {
      debugPrint("${item.key} --> ${item.value}");
    }
    _box.put("floraAPIStatus", 'free');
    return dataMap;
  }
}
