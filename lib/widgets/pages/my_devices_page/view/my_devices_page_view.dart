import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/navDrawer_view.dart';
import 'package:megaohm_app/widgets/pages/my_devices_page/model/my_devices_box.dart';

import 'package:megaohm_app/widgets/pages/my_devices_page/view/popup_menu_view.dart';



class MyDevicesView extends StatelessWidget {
  MyDevicesView({Key? key}) : super(key: key);

  final ForAllForms _forAllForms = Get.find();
  final MyDevicesBoxModel _myDevicesBoxModel = Get.find();
  final MyPopupMenu _myPopupMenu = Get.find();
  // final Box _box = Hive.box('MyDevicesBox');
  RxMap myDevices = {}.obs;
  // RxMap myDevices = {'Устройство1': '1', 'Устройство2': '2', 'Устройство3': '3'}.obs;

  @override
  Widget build(BuildContext context) {
    // _myDevicesBoxModel.cleanMyDevicesBox();
    myDevices.value =_myDevicesBoxModel.getMyDevices();

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: 'myDevices'.tr,
        actions: [
          IconButton(
            icon: Icon(Icons.add,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () async {
              Get.toNamed('/myStepper');
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
                      //   ("assets/img/icons8-arrow-up.gif"),
                      // ),
                      Icon(Icons.arrow_upward_rounded,
                          color: Theme.of(context).colorScheme.secondary),
                      SizedBox(width: 12),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('deviceNotAdded'.tr, style: TextStyle(fontSize: 18 ),),
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
