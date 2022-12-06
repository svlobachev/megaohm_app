import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/navDrawer_view.dart';
import 'package:megaohm_app/widgets/pages/my_devices/model/my_devices_box.dart';
import 'package:megaohm_app/widgets/pages/my_devices/service/web_socket.dart';
import 'package:megaohm_app/widgets/pages/my_devices/view/popup_menu_view.dart';



class MyDevicesView extends StatelessWidget {
  MyDevicesView({Key? key}) : super(key: key);

  final ForAllForms _forAllForms = Get.find();
  final AddDeviceWebSocket _addDeviceWebSocket = Get.find();
  final MyDevicesBoxModel _myDevicesBoxModel = Get.find();
  final MyPopupMenu _myPopupMenu = Get.find();
  // final Box _box = Hive.box('MyDevicesBox');
  // RxMap myDevices = {}.obs;

  RxMap myDevices = {'Устройство1': '1', 'Устройство2': '2', 'Устройство3': '3'}.obs;

  @override
  Widget build(BuildContext context) {
    _myDevicesBoxModel.cleanMyDevicesBox();
    // _myDevices.addAll(_myDevicesBoxModel.getMyDevices());

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: 'myDevices'.tr,
        actions: [
          IconButton(
            icon: Icon(Icons.add_box,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () async {
              await _addDeviceWebSocket.connectToSocket();
              Future.delayed(const Duration(milliseconds: 1000), () {
                myDevices.addAll(_myDevicesBoxModel.getMyDevices());
              });

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
                        trailing: _myPopupMenu.popupMenu( context: context, did: item.key, myDevices: myDevices),
                    ),
                ],
              ),
      ),
    );
  }
}
