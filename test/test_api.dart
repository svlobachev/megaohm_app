import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/app_services/server_availability_check.dart';
import 'package:megaohm_app/app_settings/dependency_injection.dart';

main() {

  test('getDiviceId', () async {

  });

  test('DioAPIServersCall', () async {
    dependencyInjectionInit();
    ServerAvailabilityCheck aPIServersCall = Get.find();
    MyDioService myDioService = Get.find();
    await aPIServersCall.serversCalling();

    Map<String, dynamic> dataMap =
        await myDioService.floraAPI(path: '/auth', method: 'post', data: {
      "clientID": "eee60127-1de7-59aa-92cf-d34cff956cae",
      "clientType": "flora_v1",
      "phone": "+79535687080",
      "email": "example@email.me",
      "authType": "email"
    });
    for (var item in dataMap.entries) {
      debugPrint("${item.key} - ${item.value}");
    }
  });
}
