import 'package:hive/hive.dart';

class NavDrawerShowDialogModel {
  final Box _box = Hive.box('RegistrationBox');

  dropRegistrationData() {
    _box.put('registrationStatus', '');
    _box.put('tokenAt', '');
    _box.put('tokenRt', '');
    _box.put('phone', '');
    _box.put('email', '');
  }
}
