import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/logout/view/navDrawer_logout_dialog.dart';
import 'package:megaohm_app/widgets/pages/my_devices/model/my_devices_box.dart';

class MyPopupMenu {
  final MyDevicesBoxModel _myDevicesBoxModel = Get.find();
  NavDrawerShowDialog navDrawerShowDialog = Get.find();
  var _deleteIcon = false.obs;

  popupMenu({
    required context,
    required did,
    required RxMap myDevices,
  }) {
    return PopupMenuButton(
      // constraints: const BoxConstraints(
      //   minWidth: 190,
      //   maxWidth: 200,
      // ),
      iconSize: 22,
      color: Theme.of(context).colorScheme.onPrimary,
      padding: EdgeInsets.zero,
      onSelected: (value) => value,
      itemBuilder: (context) => <PopupMenuItem>[
        PopupMenuItem(
          value: 'Menu0',
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
          value: 'Menu1',
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
          value: 'Menu2',
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
          value: 'Menu3',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.delete_forever_outlined,
                      size: 16, color: Theme.of(context).colorScheme.secondary),
                  TextButton(
                    // style: TextButton.styleFrom(
                    //   textStyle: TextStyle(
                    //     fontSize: 20,
                    //     // color: Theme.of(context).colorScheme.onPrimary,
                    //     color: Get.isDarkMode ? Colors.white : Colors.black,
                    //   ),
                    // ),
                    onPressed: () {
                      if (_deleteIcon.value) {
                        Get.back();
                        Future.delayed(const Duration(milliseconds: 500), () {
                          _myDevicesBoxModel.deleteDevice(did);
                          try {
                            myDevices = myDevices.remove(did);
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                          _deleteIcon.value
                              ? _deleteIcon.value = false
                              : _deleteIcon.value = true;
                        });
                      }
                    },
                    child: Text('delete'.tr,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? Colors.white
                              : Colors.black, // зеленый цвет текста
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
              // Obx( () =>
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _deleteIcon.value
                            ? _deleteIcon.value = false
                            : _deleteIcon.value = true;
                      },
                      icon: Obx(
                        () => Icon(
                            _deleteIcon.value ? Icons.lock_open : Icons.lock,
                            size: 18,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
