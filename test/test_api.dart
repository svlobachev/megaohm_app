import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/api_servers_call.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/app_settings/dependency_injection.dart';


main()  {

    test('DioAPIServersCall', () async {
      dependencyInjection();
      APIServersCall aPIServersCall = Get.find();
      MyDioService myDioService = Get.find();

      await aPIServersCall.serversCalling();
       Map<String, dynamic> dataMap =
      await myDioService.floraAPI(path: '/auth', method: 'post', data: {
        "clientID": "00000000-0000-0000-0000-000000000000",
        "clientType": "flora_v1",
        "phone": "+71234567890",
        "email": "example@email.me",
        "authType": "email"
      });
      for(var item in dataMap.entries){
        debugPrint("${item.key} - ${item.value}");
      }

    });

}
