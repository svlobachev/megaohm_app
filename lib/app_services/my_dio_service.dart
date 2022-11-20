import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class MyDioService {
  String _baseUrl = '';
  late Map<String, dynamic> dataMap;

  set baseUrl(String value) {
    _baseUrl = value;
    debugPrint("_baseUrl --> $_baseUrl");
  }

  String get baseUrl => _baseUrl;

  Future<Map<String, dynamic>> floraAPI({path = '', method = '', data}) async {
    var dio = Dio();
    dio.options
      ..baseUrl = _baseUrl
      ..connectTimeout = 3000 //3s
      ..receiveTimeout = 3000
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {
        HttpHeaders.userAgentHeader: 'dio',
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      };

    if (method == 'post') {
      var response = await dio.post(
        path,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      dataMap = json.decode(response.toString());
    } else if (method == 'put') {
      var response = await dio.put(
        path,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      dataMap = json.decode(response.toString());
    }
    return dataMap;
  }
}
