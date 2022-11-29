import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/server_availability_check.dart';
import 'package:megaohm_app/app_settings/dependency_injection.dart';
import 'package:uuid/uuid.dart';

main() async {
  DependencyInjection dependencyInjection =  DependencyInjection();
  test("ServerAvailabilityCheck", () async {
    ServerAvailabilityCheck serverAvailabilityCheck = ServerAvailabilityCheck();
    await serverAvailabilityCheck.serversCalling();
  });

  test(
    'userRegistration',
    () async {
      Uuid uuid = Uuid();
      var gUuid = uuid.v1();
      dependencyInjection.dependencyInjectionInit();
      ServerAvailabilityCheck aPIServersCall = Get.find();
      MyDioService myDioService = Get.find();
      await aPIServersCall.serversCalling();

      Map<String, dynamic> dataMap = await myDioService.floraAPI(
        path: '/auth',
        method: 'post',
        data: {
          "clientID": gUuid,
          "clientType": "flora_v1",
          "phone": "+79535687080",
          "email": "gsvlobachev@gmail.com",
          "authType": "email"
        },
      );
      for (var item in dataMap.entries) {
        debugPrint("${item.key} - ${item.value}");
      }
    },
  );

  test(
    'confirmUserRegistration',
    () async {
      dependencyInjection.dependencyInjectionInit();
      ServerAvailabilityCheck aPIServersCall = Get.find();
      MyDioService myDioService = Get.find();
      await aPIServersCall.serversCalling();

      Map<String, dynamic> dataMap = await myDioService.floraAPI(
        path: "/auth/_token",
        method: 'put',
        data: {"code": "857605"},
      );
      for (var item in dataMap.entries) {
        debugPrint("${item.key} - ${item.value}");
      }
    },
  );
}
