import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megaohm_app/app_settings/app_view.dart';

import 'app_services/api_servs_call.dart';
import 'app_services/hive_init.dart';
import 'app_settings/dependency_injection.dart';

Future<void> main() async {
  dependencyInjection();
  ServerAvailabilityCheck serverAvailabilityCheck = Get.find();
  serverAvailabilityCheck.serversCalling();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox('RegistrationBox');
  hiveInit();
  runApp(MyApp());
  FlutterNativeSplash.remove();
}
