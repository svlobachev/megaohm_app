import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/logout/view/navDrawer_logout_dialog.dart';
// import 'package:megaohm_app/widgets/pages/my_devices/model/my_devices_box.dart';

class MyPopupMenu {
  // final MyDevicesBoxModel _myDevicesBoxModel = Get.find();
  NavDrawerShowDialog navDrawerShowDialog = Get.find();

  popupMenu({
    required context,
    required did,
    required RxMap myDevices,
  }) {
    return PopupMenuButton(
      iconSize: 22,
      color: Theme.of(context).colorScheme.onPrimary,
      padding: EdgeInsets.zero,
      onSelected: (value) => value,
      itemBuilder: (context) => <PopupMenuItem>[
        PopupMenuItem(
          value: 'demoMenu',
          child: Row(
            children: [
              Icon(Icons.library_books_outlined,
                  size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Журнал событий',
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'demoMenu1',
          child: Row(
            children: [
              Icon(Icons.settings_applications_outlined,
                  size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Настройки',
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'demoMenu2',
          child: Row(
            children: [
              Icon(Icons.tips_and_updates_outlined,
                  size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Тестирование',
              ),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            // _myDevicesBoxModel.deleteDevice(did);
            // try {
            //   myDevices = myDevices.remove(did);
            // } catch (e) {
            //   debugPrint(e.toString());
            // }
          },
          value: 'demoMenu3',
          child: Wrap(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.delete_forever_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary),
                      Text(
                        ' Удалить',
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.lock,
                            size: 16,
                            color: Theme.of(context).colorScheme.secondary)),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
