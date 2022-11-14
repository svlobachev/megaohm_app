import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:megaohm_app/app_settings/theme_scheme.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);
  // Locale _locale = Locale('ru', 'RU');

  @override
  Widget build(BuildContext context) {
    const UserAccountsDrawerHeader drawerHeader = UserAccountsDrawerHeader(
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
            title: Text('profile'.tr),
            leading: const Icon(Icons.account_box_outlined),
            onTap: () {
              Navigator.pop(context);
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
            title: Text('languages'.tr),
            leading: const Icon(Icons.language),
            onTap: () {
              // _locale == Locale('en', 'US')
              //     ? Get.updateLocale(Locale('ru', 'RU'))
              //     : Get.updateLocale(Locale('en', 'US'));
              Get.back();
            },
          ),
          ListTile(
            title: Text('instruction'.tr),
            leading: const Icon(Icons.integration_instructions),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('contactWithDevelopers'.tr),
            leading: const Icon(Icons.games_sharp),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('settings'.tr),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
