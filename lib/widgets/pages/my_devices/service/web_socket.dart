import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:hive/hive.dart';
import 'package:web_socket_channel/io.dart';

class AddDeviceWebSocket {
  final MySnackBarGet _mySnackBarGet = Get.find();
  final ForAllForms _forAllForms = Get.find();
  final Box _box = Hive.box('MyDevicesBox');
  Map<String, dynamic> _dataMap = {};
  late IOWebSocketChannel _client;
  bool _isConnected = false;

  connectToSocket() async {

       await WebSocket.connect('ws://192.168.31.81:44300/ws').then((ws)  async {
      _client = IOWebSocketChannel(ws);
      debugPrint("--> Socket added");
      await _listenToMessage();
      _isConnected = true;
      _mySnackBarGet.mySnackBar(
        text: 'Устройство найдено!'.tr,
        icon: Icon(
          Icons.devices_other,
          // color: colorForSnackBarErrors,
          color: _forAllForms.colorForSnackBarIcons,
          size: 30.0,
        ),
      );
    }).onError((error, stackTrace) {
      if (error.toString() != '') {
        debugPrint(error.toString());
        debugPrint("--> Socket not added");
        _isConnected = false;
        // Timer.periodic(Duration(seconds: _heartbeatInterval), (Timer timer){
        //   connectToSocket();
        // });
        _mySnackBarGet.mySnackBar(
          text: 'Устройство не найдено!'.tr,
          icon: Icon(
            Icons.devices,
            // color: colorForSnackBarErrors,
            color: _forAllForms.colorForSnackBarIcons,
            size: 30.0,
          ),
        );
      }
    });
    return _isConnected;
  }

  _listenToMessage() async {
    // if (await _client.stream.isEmpty) {
    await _client.stream.listen((message) {
      if (message != null) {
        _dataMap = json.decode(message);
        for (var item in _dataMap.entries) {
          if (!_box.containsKey(item.value) && item.key == 'did') {
            _box.put(item.value, 'offline');
          }
        }
      }
      debugPrint("status.goingAway --> ${status.goingAway}");
      disconnect();
    }, onError: (error, StackTrace stackTrace) {
      if (error.toString() != '') {
        debugPrint(error.toString());
        disconnect();
      }
    }, onDone: () {
      debugPrint('--> ws channel closed');
      disconnect();
    }, cancelOnError: true);
    // }
  }


  disconnect() {
    _client.sink.close(status.goingAway);
    _isConnected = false;
  }
}
