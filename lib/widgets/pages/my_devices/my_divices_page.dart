import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/navDrawer_view.dart';

class MyDevices extends StatelessWidget {
  MyDevices({Key? key}) : super(key: key);
  final ClickInternetCheck _clickInternetCheck = Get.find();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: NavDrawer(),
      body: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                const Text("Добро пожаловать!"),
                ElevatedButton(
                  onPressed: () async {
                    if (await _clickInternetCheck.initConnectivity() ) {

                    }
                  },
                  child: const Text("Обновить"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
