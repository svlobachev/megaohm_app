import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../navigation/navDrawer.dart';

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

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor:
            Platform.isIOS ? Theme.of(context).colorScheme.secondary : null,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.tertiary,
          statusBarIconBrightness:
              Get.isDarkMode ? Brightness.dark : Brightness.light,
          // For Android (dark icons)
          statusBarBrightness: Get.isDarkMode
              ? Brightness.dark
              : Brightness.light, // For iOS (dark icons)
        ),
      ),
      drawer: NavDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'enter'.tr,
                          textDirection: TextDirection.ltr,
                          // style:
                          //   Theme.of(context).textTheme.headline3,
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
              ),
              Container(
                height: 80,
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'EmailOrPhoneNumber'.tr,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password'.tr,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/learning_page2'),
                  child: const Text('Далее'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
