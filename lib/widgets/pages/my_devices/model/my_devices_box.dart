import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class MyDevicesBoxModel {
  final Box _box = Hive.box('MyDevicesBox');
  final Map<String, String> _myDevices = {};

  cleanMyDevicesBox(){
    _box.deleteAll(_box.keys);
  }

  Map<String, String> getMyDevices() {
    if (_box.keys.isNotEmpty) {
      for (var item in _box.keys) {
        _myDevices[item] = _box.get(item);
      }
    } else {
      debugPrint("--> _box.keys.isEmpty");
    }
    return _myDevices;
  }

  deleteDevice(String did){
    if (_box.keys.isNotEmpty && _box.containsKey(did)) {
         _box.delete(did);
    } else {
      debugPrint("--> _box.keys.isEmpty");
    }
  }
}
