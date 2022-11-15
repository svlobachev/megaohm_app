import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../navigation/navDrawer.dart';
import '../navigation/systemBar.dart';

class MyLogin extends StatelessWidget {
  MyLogin({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // final SessionController _session = Get.find();
    // _session.sessionControl();

    // if (Platform.isAndroid) {
    //   // код, предназначенный для Android
    // } else if (Platform.isIOS) {
    //   // код, предназначенный для iOS
    // }
    double vertical = 10;
    double horizontal =  20;
    double height = 70;
    return Scaffold(
      appBar: const SysBar(),
      drawer: const NavDrawer(),
      body: Center(
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'enter'.tr,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding:  EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'EmailOrPhoneNumber'.tr,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding:  EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    key: UniqueKey(),
                    height: height,
                    padding:  EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed('/learning_page2'),
                      child: Text('toComeIn'.tr),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 0, horizontal: horizontal),
                  child: TextButton(
                    onPressed: () => Get.toNamed('/learning_page2'),
                    child: Text('registration'.tr),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}
