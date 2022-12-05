import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/navDrawer_view.dart';
import 'package:megaohm_app/widgets/pages/my_devices/service/web_socket.dart';
import 'popup_menu_view.dart';

class MyDevicesView extends StatelessWidget {
  MyDevicesView({Key? key}) : super(key: key);
  ForAllForms _forAllForms = Get.find();
  AddDeviceWebSocket _addDeviceWebSocket = Get.find();
  final Box _box = Hive.box('MyDevicesBox');

  // RxMap myDevices = {'Устройство1': '1', 'Устройство2': '2', 'Устройство3': '3'}.obs;
  RxMap myDevices = {}.obs;

  @override
  Widget build(BuildContext context) {
    _addDeviceWebSocket.webSocketState();
    if (_box.keys.isNotEmpty) {
      for (var item in _box.keys) {
        myDevices.value[item]= _box.get(item);
      }
    }
    // if (_box.containsKey('did') && _box.get('did') != '') {
    //   myDevices.value[_box.get('did')]= 'offline';
    //
    // }
    // _WebSocketState();

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: 'myDevices'.tr,
        actions: [
          IconButton(
            icon: Icon(Icons.add_box,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {
              Get.toNamed('/addDevice');
            },
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: Obx(
        () => myDevices.isEmpty
            ? Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Image.asset(
                      //   height: 32,
                      //   ("assets/img/strelka-verh.gif"),
                      //   // color: Color(0xFF3A5A98),
                      // ),
                      // Icon(
                      //   Icons.arrow_upward_outlined,
                      //   color: _iconColor.value,
                      // ),
                      Image.asset(
                        height: 32,
                        ("assets/img/icons8-arrow-up.gif"),
                        // color: Color(0xFF3A5A98),
                      ),
                      SizedBox(width: 9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('deviceNotAdded'.tr),
                    ],
                  ),
                  SizedBox(
                    height: _forAllForms.bottomSizedBoxHeight,
                  )
                ],
              )
            : ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (var item in myDevices.entries)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: ImageIcon(
                          const AssetImage('assets/img/device_connected.png'),
                          size: 22,
                          color: Theme.of(context).colorScheme.secondary,
                          // color: Color(0xff13a8b0),
                        ),
                      ),
                      title: Text(item.key, overflow: TextOverflow.ellipsis),
                      subtitle: Text(item.value),
                      trailing: const PopupMenu(),
                    ),
                ],
              ),
      ),
    );
  }
}
