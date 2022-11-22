import 'package:hive/hive.dart';

hiveInit() {
  var box = Hive.box('RegistrationBox');
  // box.deleteFromDisk();
  box.delete('token');
  // box.delete('registrationComplete');
  // box.delete('registrationPinCode');
  //
  // box.put('session', '');
  //
  // if (!box.containsKey('serverUserUuid')) {
  //   box.put('serverUserUuid', '');
  // }
}
