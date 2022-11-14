import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megaohm_app/app_settings/app_view.dart';
import 'app_settings/dependency_injection.dart';
import 'app_settings/parts/hive_init.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox('RegistrationBox');
  hiveInit();
  dependencyInjection();
  runApp(MyApp());
  FlutterNativeSplash.remove();
}
