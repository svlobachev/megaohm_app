import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iot_wifi/flutter_iot_wifi.dart';
import 'package:permission_handler/permission_handler.dart';

class IotWiFiAccessPoint {
  final String ssid = "Xiaomi_521F";
  final String password = "Gctb3w24";

  Future<bool> _checkPermissions() async {
    if (Platform.isIOS || await Permission.location.request().isGranted) {
      return true;
    }
    return false;
  }

  void _connect() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.connect(ssid, password, prefix: true)
          .then((value) => debugPrint("--> connect initiated: $value"));
    } else {
      debugPrint("--> don't have permission");
    }
  }

  void _disconnect() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.disconnect()
          .then((value) => debugPrint("--> disconnect initiated: $value"));
    } else {
      debugPrint("--> don't have permission");
    }
  }

  void _scan() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.scan().then((value) => debugPrint("--> scan started: $value"));
    } else {
      debugPrint("--> don't have permission");
    }
  }

  void _list() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.list().then((value) => debugPrint("--> ssids: $value"));
    } else {
      debugPrint("--> don't have permission");
    }
  }

  void _current() async {
    if (await _checkPermissions()) {
      FlutterIotWifi.current().then((value) => debugPrint("--> current ssid: $value"));
    } else {
      debugPrint("--> don't have permission");
    }
  }
// _CustomButton(onPressed: _connect, child: const Text("Connect")),
// _CustomButton(onPressed: _disconnect, child: const Text("Disconnect")),
// _CustomButton(onPressed: _scan, child: const Text("Scan (Android only)")),
// _CustomButton(onPressed: _list, child: const Text("List (Android only)")),
// _CustomButton(onPressed: _current, child: const Text("Current")),
}
