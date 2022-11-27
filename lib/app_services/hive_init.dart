import 'package:hive/hive.dart';

hiveInit() {
  var box = Hive.box('RegistrationBox');
  box.put('baseUrl', '');

  // box.deleteFromDisk();

  // box.delete('registrationStatus');
  //

  // box.put('session', '');
  //
  // if (!box.containsKey('serverUserUuid')) {
  //   box.put('serverUserUuid', '');
  // }
}
