import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'my_dio_service.dart';

class ServerAvailabilityCheck {
  MyDioService myDioSettings = Get.find();
  serversCalling() async {
    String urlOfServer;
    List<String> listOfServers = [
      'https://api1.megaohm.ru:44302/mvp',
      'https://api2.megaohm.ru:44302/mvp',
      'https://dev.api.megaohm.ru:44302/mvp'
    ];

    Future<bool> serverCall(String baseUrl) async {
      try {
        Dio dio = Dio();
        await dio.post(baseUrl);
      } on DioError catch (e) {
        final response = e.response;
        if (response != null) {
          // debugPrint(response.statusCode);
          return true;
        }
      }
      return false;
    }

    for (urlOfServer in listOfServers) {
      if (await serverCall(urlOfServer)) {
        // debugPrint("Рабочий сервер --> $urlOfServer");
        myDioSettings.baseUrl = urlOfServer;
        return urlOfServer;
      }
    }
  }
}
