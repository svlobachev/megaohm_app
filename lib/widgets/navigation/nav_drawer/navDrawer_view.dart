import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_settings/theme_scheme.dart';

// import 'package:megaohm_app/app_settings/theme_scheme.dart';

import 'logout/view/navDrawer_logout_dialog.dart';

class NavDrawer extends StatelessWidget {
   NavDrawer({Key? key}) : super(key: key);
  var box = Hive.box('RegistrationBox');


  @override
  Widget build(BuildContext context) {
    String accountName = box.get('name');
    String accountEmail = box.get('email');
    NavDrawerShowDialog navDrawerShowDialog = Get.find();
    UserAccountsDrawerHeader drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      accountName: Text(accountName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          )),
      accountEmail: Text(accountEmail,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          )),
      currentAccountPicture:  CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Image.asset("assets/img/logo_megaohm.png", height: 47, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
    return Drawer(
      child: ListView(
        children: [
          drawerHeader,
          ListTile(
            title: Text('mainPage'.tr),
            leading: const Icon(Icons.pages),
            onTap: () {
              Get.back();
              Get.toNamed('/');
            },
          ),
          ListTile(
            title: Text('lightDarkModes'.tr),
            leading: const Icon(Icons.dark_mode),
            onTap: () {
              Get.changeTheme(
                  Get.isDarkMode ? MyFlexThemeDataLight : MyFlexThemeDataDark);
              Get.back();
            },
          ),
          ListTile(
            title: Text('myDevices'.tr),
            leading: const Icon(Icons.devices_other),
            onTap: () {
              Get.back();
              Get.toNamed('/myDevices');
            },
          ),
          ListTile(
            title: Text('settings'.tr),
            leading: const Icon(Icons.settings),
            onTap: () {
              Get.back();
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
              navDrawerShowDialog.dialogBuilder(context);
            },
          ),
        ],
      ),
    );
  }
}
