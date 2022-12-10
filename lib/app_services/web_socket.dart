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
  final Box _devicesBox = Hive.box('MyDevicesBox');
  final Box _floraAPIBox = Hive.box('FloraAPIBox');
  final Box _testBox = Hive.box('TestBox');
  Map<String, dynamic> _dataMap = {};
  late IOWebSocketChannel _client;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  connectToSocket(
      {showAllSnackBar = false,
      showOnlySuccessfulSnackBar = false,
      onlyShowsFailedSnackBar = false}) async {
    if (_isConnected) {
      disconnect();
    }
    // await WebSocket.connect("ws://192.168.31.81/ws").then((ws) async {
    await WebSocket.connect("ws://${_testBox.get('ip')}:44300/ws")
        .then((ws) async {
      _client = IOWebSocketChannel(ws);
      debugPrint("--> WSocket added");
      _listenToMessage();
      _isConnected = true;
      if (showAllSnackBar || showOnlySuccessfulSnackBar) {
        _mySnackBarGet.mySnackBar(
          text: 'deviceFound'.tr,
          icon: Icon(
            Icons.devices_other,
            // color: colorForSnackBarErrors,
            color: _forAllForms.colorForSnackBarIcons,
            size: 30.0,
          ),
        );
      }
    }).onError((error, stackTrace) {
      if (error.toString() != '') {
        debugPrint(error.toString());
        debugPrint("--> WSocket not added");
        _isConnected = false;
        // Timer.periodic(Duration(seconds: _heartbeatInterval), (Timer timer){
        //   connectToSocket();
        // });
        if (showAllSnackBar || onlyShowsFailedSnackBar) {
          _mySnackBarGet.mySnackBar(
            text: 'deviceNotNound'.tr,
            icon: Icon(
              Icons.devices,
              // color: colorForSnackBarErrors,
              color: _forAllForms.colorForSnackBarIcons,
              size: 30.0,
            ),
          );
        }
      }
    });
    return _isConnected;
  }

  _listenToMessage() {
    _client.stream.listen((message) {
      if (message != null) {
        _dataMap = json.decode(message);
        if (_dataMap.containsKey('did') &&
            !_devicesBox.containsKey(_dataMap['did'])) {
          _devicesBox.put(_dataMap['did'], 'offline');
        }
        if (_dataMap.containsKey('cmd')) {
          _floraAPIBox.put('cmd', _dataMap['cmd']);
          // debugPrint("WS cmd --> ${_floraAPIBox.get('cmd')}");
        }
        if (_dataMap.containsKey('state')) {
          _floraAPIBox.put('state', _dataMap['state']);
          // debugPrint("WS state --> ${_floraAPIBox.get('state')}");
        }
      }
      debugPrint("status.goingAway --> ${status.goingAway}");
      // disconnect();
    }, onError: (error, StackTrace stackTrace) {
      if (error.toString() != '') {
        debugPrint(error.toString());
        disconnect();
      }
    }, onDone: () {
      debugPrint('--> WSocket closed');
      disconnect();
    }, cancelOnError: true);
  }

  sendMessageToDevice(String message) {
    if (_isConnected) {
      _client.sink.add(message);
    }
  }

  disconnect() {
    _client.sink.close(status.goingAway);
    _isConnected = false;
  }
}
