import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyDioService {
  final Box _box = Hive.box('RegistrationBox');

  late Map<String, dynamic> dataMap = {};

  Future<Map<String, dynamic>> floraAPI({path = '', method = '', data}) async {
    var baseUrl = _box.get("baseUrl");
    var dio = Dio();
    if (baseUrl.isNotEmpty) debugPrint("floraAPI_baseUrl --> $baseUrl");
    dio.options
      ..baseUrl = baseUrl
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
      // var response;
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
            : dataMap["DioEmpty"] = "--> put response is empty";
      } on DioError catch (e) {
        dataMap["DioError"] = e.message;
        debugPrint(e.message.toString());
        final resp = e.response;
        resp != null ? {
          debugPrint(resp.statusCode.toString()),
          dataMap["DioStatusCode"] = resp.statusCode.toString(),
          dataMap["DioStatusMessage"] = resp.statusMessage.toString()
        } : null;
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
            : dataMap["DioEmpty"] = "--> put response is empty";
      } on DioError catch (e) {
        dataMap["DioError"] = e.message;
        final resp = e.response;
        resp != null ? {
          debugPrint(resp.statusCode.toString()),
          dataMap["DioStatusCode"] = resp.statusCode.toString(),
          dataMap["DioStatusMessage"] = resp.statusMessage.toString()
        } : null;
      }
    }
    return dataMap;
  }
}
