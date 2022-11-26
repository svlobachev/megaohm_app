import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'HTTP_Dio/access_token_renew.dart';


class RegistrationStatusController{
  final AccessTokenRenew accessTokenRenew = Get.find();

  final _box = Hive.box('RegistrationBox');
    registrationControl(){
      if (_box.containsKey('registrationStatus') && _box.get('registrationStatus') == 'completed') {
        accessTokenRenew.accessTokenRenew();
        return true;
      }
      return false;
  }
}