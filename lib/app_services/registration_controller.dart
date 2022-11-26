import 'package:hive/hive.dart';

class RegistrationController{
  final _box = Hive.box('RegistrationBox');
    registrationControl(){
      if (_box.containsKey('registrationStatus') && _box.get('registrationStatus') == 'completed') {
        return true;
      }
      return false;
  }
}