import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_services/web_socket.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/add_device_page/service/iot_wifi_access_point.dart';

import '../controller/connect_device_controller.dart';


class WebSocketService{
  final AddDeviceWebSocket _addDeviceWebSocket = Get.find();
  final ConnectDeviceController _connectDeviceController = Get.find();
  final IotWiFiAccessPoint _lotWiFiAccessPoint = Get.find();

  final Box _floraAPIBox = Hive.box('FloraAPIBox');


  Future<bool> sendMessage(String command)  async {
    String _SSIDFieldIsFilled = _connectDeviceController.SSIDFieldIsFilled;
    String _PSWRDFieldIsFilled = _connectDeviceController.PSWRDFieldIsFilled;
    if(command == "inet" && _SSIDFieldIsFilled != '' && _PSWRDFieldIsFilled != '') {
      Map myMassage = {
        "cmd": "inet",
        "ssid": _SSIDFieldIsFilled,
        "pwd": _PSWRDFieldIsFilled
      };
      _addDeviceWebSocket
          .sendMessageToDevice(json.encode(myMassage));
      if(_floraAPIBox.get('state') == 'ok') {
        debugPrint('--> inet returned ${_floraAPIBox.get('state')}');
        return true;
      }
    }
    else if(command == "reset") {
      Map myMassage = {
        "cmd": "reset",
      };
      _addDeviceWebSocket
          .sendMessageToDevice(json.encode(myMassage));
      if(_floraAPIBox.get('state') == 'ok') {
        _addDeviceWebSocket.disconnect();
        if(await _lotWiFiAccessPoint.current() == _lotWiFiAccessPoint.currentSsid){
          _lotWiFiAccessPoint.disconnect();
        }
        debugPrint('--> reset returned ${_floraAPIBox.get('state')}');
        return true;
      }
    }
    return false;
  }
}