import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class WiFiIoT {
  // final IotWiFiAccessPoint _iotWiFiAccessPoint = IotWiFiAccessPoint();
  String _ssid = '';
  String _password = '';
  bool _isEnabled = false;
  bool _isConnected = false;

  set ssid(String value) {
    _ssid = value;
  }

  set password(String value) {
    _password = value;
  }

  bool get isConnected => _isConnected;

  Future<bool> _checkPermissions() async {
    if (Platform.isIOS || await Permission.location.request().isGranted) {
      return true;
    }
    return false;
  }

  checkStateWifiNetwork() async {
    if (await _checkPermissions()) {
      await WiFiForIoTPlugin.isEnabled().then((val) {
        _isEnabled = val;
        debugPrint("_isEnabled --> $_isEnabled");
      });

      await WiFiForIoTPlugin.isConnected().then((val) {
        _isConnected = val;
        debugPrint("_isConnected --> $_isConnected");
      });
      WiFiForIoTPlugin.isWiFiAPEnabled().then((val) {
        debugPrint("_isWiFiAPEnabled --> $val");
      }).catchError((val) {
        // _isWifiAPSupported = false;
      });
    }
  }

  connectWifiNetwork() async {
    if (await _checkPermissions()) {
      bool connect = await WiFiForIoTPlugin.connect(
        _ssid,
        password: _password,
        security: NetworkSecurity.WPA,
        joinOnce: true,
        timeoutInSeconds: 30,
      );
      if (connect) {
        _isConnected = true;
        bool forceWifiUsage = await WiFiForIoTPlugin.forceWifiUsage(true);
        debugPrint("forceWifiUsage --> $forceWifiUsage");
        getInfoFromNetwork();
      } else {
        _isConnected = false;
        bool forceWifiUsage = await WiFiForIoTPlugin.forceWifiUsage(false);
        debugPrint("forceWifiUsage --> $forceWifiUsage");
      }
    }
  }

  removeWifiNetwork() async {
    if (await _checkPermissions()) {
      var removeWifiNetwork = await WiFiForIoTPlugin.getSSID().then((val) {
        return WiFiForIoTPlugin.removeWifiNetwork(val!.trim());
      });
      WiFiForIoTPlugin.forceWifiUsage(false);
      debugPrint("removeWifiNetwork --> $removeWifiNetwork");
      _isConnected = false;
    }
  }

  getInfoFromNetwork() async {
    var getSSID = await WiFiForIoTPlugin.getSSID();
    debugPrint("getSSID() -->  $getSSID");

    var getBSSID = await WiFiForIoTPlugin.getBSSID();
    debugPrint("getBSSID() -->  $getBSSID");

    var getCurrentSignalStrength =
        await WiFiForIoTPlugin.getCurrentSignalStrength();
    debugPrint("getCurrentSignalStrength() -->  $getCurrentSignalStrength");

    var getFrequency = await WiFiForIoTPlugin.getFrequency();
    debugPrint("getFrequency() -->  $getFrequency");

    var getIP = await WiFiForIoTPlugin.getIP();
    debugPrint("getIP() -->  $getIP");
  }
}
