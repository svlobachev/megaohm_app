import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'navDrawer_show_dialog.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);
  // Locale _locale = Locale('ru', 'RU');

  @override
  Widget build(BuildContext context) {
    NavDrawerShowDialog _navDrawerShowDialog = Get.find();
     UserAccountsDrawerHeader drawerHeader = UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
      accountName: Text('Uncle Bob'),
      accountEmail: Text('uncle_bob@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
    return Drawer(

      child: ListView(
        children: [
          drawerHeader,
          ListTile(
            title: Text('myDevices'.tr),
            leading: const Icon(Icons.devices_other),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   title: Text('lightDarkModes'.tr),
          //   leading: const Icon(Icons.dark_mode),
          //   onTap: () {
          //     Get.changeTheme(
          //         Get.isDarkMode ? MyFlexThemeDataLight : MyFlexThemeDataDark);
          //     Get.back();
          //   },
          // ),
          ListTile(
            title: Text('settings'.tr),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('aboutTheApp'.tr),
            leading: const Icon(Icons.info_outline),
            onTap: () {
              // _locale == Locale('en', 'US')
              //     ? Get.updateLocale(Locale('ru', 'RU'))
              //     : Get.updateLocale(Locale('en', 'US'));
              Get.back();
            },
          ),
          ListTile(
            title: Text('goOut'.tr),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              _navDrawerShowDialog.dialogBuilder(context);
            },
          ),

        ],
      ),
    );
  }
}
