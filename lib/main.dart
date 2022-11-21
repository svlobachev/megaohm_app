import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megaohm_app/app_services/background_internet_check.dart';
import 'package:megaohm_app/app_settings/app_view.dart';

import 'app_services/hive_init.dart';
import 'app_settings/dependency_injection.dart';

Future<void> main() async {
  dependencyInjectionInit();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  BackgroundInternetCheck backgroundInternetCheck = Get.find();
  backgroundInternetCheck.initConnectivity();
  backgroundInternetCheck.i++;
  await Hive.initFlutter();
  await Hive.openBox('RegistrationBox');
  hiveInit();
  runApp(MyApp());
  FlutterNativeSplash.remove();

}
