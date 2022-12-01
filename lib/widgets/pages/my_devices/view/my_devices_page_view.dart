import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/navDrawer_view.dart';
import 'context_menu_view.dart';

class MyDevicesView extends StatelessWidget {
  MyDevicesView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:  MyAppBar(appBarTitle: 'myDevices'.tr),
      drawer: NavDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (int index = 1; index < 26; index++)
            ListTile(
              leading:  ExcludeSemantics(
                child:   ImageIcon(
                  const AssetImage('assets/img/device_connected.png'),
                  size: 22,
                  color: Theme.of(context).colorScheme.secondary,
                  // color: Color(0xff13a8b0),
                ),
              ),
              title: Text("Устройство $index"),
              subtitle: Text(index.toString()),
                trailing: const ContextMenuDemo(),
            ),
        ],
      ),
    );
  }
}
