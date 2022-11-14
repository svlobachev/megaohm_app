import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class SessionController{
  var box = Hive.box('RegistrationBox');
  sessionPutToHive(){
    const uuid = Uuid();
    var uid = uuid.v1();
    box.put('session', uid);
    // debugPrint("Session --> $uid");
  }
    sessionControl(){
    var session = box.get('session');
    if(session.isEmpty){
      debugPrint("Session --> is empty!!!");
      Get.back();
    }
  }
}