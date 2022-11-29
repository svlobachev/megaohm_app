import 'package:hive/hive.dart';
class HiveInit {
  hiveInit() {
    var box = Hive.box('FloraAPIBox');
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
}