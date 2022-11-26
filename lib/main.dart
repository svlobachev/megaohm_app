import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megaohm_app/app_services/internet_check/background_internet_check.dart';
import 'package:megaohm_app/app_settings/app_view.dart';

import 'app_services/HTTP_Dio/my_http_overrides.dart';
import 'app_services/get_device_id.dart';
import 'app_services/hive_init.dart';
import 'app_settings/dependency_injection.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox('RegistrationBox');
  hiveInit();
  dependencyInjectionInit();
  BackgroundInternetCheck backgroundInternetCheck = Get.find();
  backgroundInternetCheck.initConnectivity();
  backgroundInternetCheck.i++;
  runApp(MyApp());
  GetDeviceId getDeviceId = Get.find();
  getDeviceId.getDeviceId();
  FlutterNativeSplash.remove();
}
