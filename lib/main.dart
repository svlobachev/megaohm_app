import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megaohm_app/app_settings/app_view.dart';
import 'app_settings/dependency_injection.dart';
import 'app_settings/parts/hive_init.dart';


Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('RegistrationBox');
  hiveInit();
  runApp(MyApp());
  dependencyInjection();
}