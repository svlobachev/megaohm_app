import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'access_token_renew.dart';
import 'my_dio_service.dart';

class ServerAvailabilityCheck {
  final Box _box = Hive.box('RegistrationBox');
  MyDioService myDioSettings = MyDioService();
  final AccessTokenRenew accessTokenRenew = Get.find();

  serversCalling() async {
    String urlOfServer;
    List<String> listOfServers = [
      'url: https://dev.api.megaohm.ru:44301/mvp',
      // 'https://api1.megaohm.ru:44302:44302/mvp',
      // 'https://api2.megaohm.ru:44302:44302/mvp',
    ];

    Future<bool> serverCall(String baseUrl) async {
      try {
        Dio dio = Dio();
        await dio.post(baseUrl);
      } on DioError catch (e) {
        final response = e.response;
        if (response != null) {
          return true;
        }
      }
      return false;
    }

    for (urlOfServer in listOfServers) {
      if (await serverCall(urlOfServer)) {
        debugPrint("Рабочий сервер --> $urlOfServer");
        _box.put("baseUrl", urlOfServer);
        accessTokenRenew.accessTokenRenew();
        break;
      }
    }
  }
}
