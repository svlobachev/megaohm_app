import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_iot_wifi/flutter_iot_wifi.dart';
import 'package:permission_handler/permission_handler.dart';

class IotWiFiAccessPoint {
  String _ssid = '';
  String _password = '';
  String _currentSsid = '';
  bool _statusOfConnection = false;



  String get currentSsid => _currentSsid;

  set ssid(String value) {
    _ssid = value;
  }

  set password(String value) {
    _password = value;
  }



  Future<bool> _checkPermissions() async {
    if (Platform.isIOS || await Permission.location.request().isGranted) {
      return true;
    }
    return false;
  }

  Future<bool> connect() async {
    if(_statusOfConnection){
      await disconnect();
    }
    if (await _checkPermissions()) {
      await disconnect();
      await FlutterIotWifi.connect(_ssid, _password, prefix: true).then(
        (value) {
          if (value == true) {
            _currentSsid = _ssid;
            _statusOfConnection = true;
            debugPrint("--> : connect initiated: $value");
            return true;
          }
        },
      );
    } else {
      debugPrint("--> don't have permission");
    }
    return false;
  }

  Future<bool> disconnect() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.disconnect().then(
        (value) {
          if (value == true) {
            _statusOfConnection = false;
            debugPrint("--> disconnect initiated: $value");
            return true;
          }
        },
      );
    } else {
      debugPrint("--> don't have permission");
    }
    return false;
  }

  Future<String> current() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.current().then((value) {
        if (value != '') {
          debugPrint("--> current ssid: $value");
          return value;
        }
      });
    } else {
      debugPrint("--> don't have permission");
    }
    return '';
  }

// void _scan() async {
//   if (await _checkPermissions()) {
//     FlutterIotWifi.scan()
//         .then((value) => debugPrint("--> scan started: $value"));
//   } else {
//     debugPrint("--> don't have permission");
//   }
// }
//
// void _list() async {
//   if (await _checkPermissions()) {
//     FlutterIotWifi.list().then((value) => debugPrint("--> ssids: $value"));
//   } else {
//     debugPrint("--> don't have permission");
//   }
// }

// _CustomButton(onPressed: _connect, child: const Text("Connect")),
// _CustomButton(onPressed: _disconnect, child: const Text("Disconnect")),
// _CustomButton(onPressed: _scan, child: const Text("Scan (Android only)")),
// _CustomButton(onPressed: _list, child: const Text("List (Android only)")),
// _CustomButton(onPressed: _current, child: const Text("Current")),
}
