import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/access_token_renew.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';

import '../navigation/myAppBar.dart';
import '../navigation/navDrawer.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final ClickInternetCheck _clickInternetCheck = Get.find();
  final AccessTokenRenew _accessTokenRenew = Get.find();
  final Box _box = Hive.box('RegistrationBox');


  @override
  Widget build(BuildContext context) {
    String _tokenRt = _box.get("tokenRt");
    String _tokenAt = _box.get("tokenAt");
    var tokenRt = _tokenRt.obs;
    var tokenAt = _tokenAt.obs;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: NavDrawer(),
      body: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                const Text("Добро пожаловать!"),
                ElevatedButton(
                  onPressed: () async {
                    if (await _clickInternetCheck.initConnectivity() &&
                        await _accessTokenRenew.accessTokenRenew()) {
                      tokenRt.value = _accessTokenRenew.tokenRt;
                      tokenAt.value = _accessTokenRenew.tokenAt;
                    }
                  },
                  child: const Text("Обновить"),
                ),
                Obx(
                  () => Text("tokenRt --> $tokenRt"),
                ),
                Obx(
                  () => Text("tokenAt --> $tokenAt"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
