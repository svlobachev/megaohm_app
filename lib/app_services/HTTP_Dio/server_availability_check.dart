import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'access_token_renew.dart';
import 'my_dio_service.dart';

class ServerAvailabilityCheck {
  final Box _box = Hive.box('RegistrationBox');
  MyDioService myDioSettings = MyDioService();
  final AccessTokenRenew accessTokenRenew = Get.find();
  serversCalling()   async {

    String urlOfServer;
    List<String> listOfServers = [
      'https://dev.api.megaohm.ru:44302/mvp',
          'https://api1.megaohm.ru:44302/mvp',
      'https://api2.megaohm.ru:44302/mvp',
    ];

    Future<bool> serverCall(String baseUrl) async {

      try {
        Dio dio = Dio();
        await dio.post(baseUrl);
      } on DioError catch (e) {
        // debugPrint(e.message);
        final response = e.response;
        if (response != null) {
          // debugPrint(response.statusCode.toString());
          return true;
        }
      }
      return false;
    }

    for (urlOfServer in listOfServers) {
      if (await serverCall(urlOfServer)) {
        // debugPrint("Рабочий сервер --> $urlOfServer");
        if (_box.get('baseUrl') == '') {
          _box.put("baseUrl", urlOfServer);
          accessTokenRenew.accessTokenRenew();
          // myDioSettings.baseUrl = urlOfServer;
          break;
        }
      }
    }
  }
}
