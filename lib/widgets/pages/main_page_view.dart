import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_api_service.dart';

import '../../app_services/click_internet_check.dart';
import '../navigation/myAppBar.dart';
import '../navigation/navDrawer.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final ClickInternetCheck _clickInternetCheck = Get.find();
  final ConfirmationAPIService _confirmationAPIService = Get.find();

  @override
  Widget build(BuildContext context) {
    var tokenRt = _confirmationAPIService.tokenRt.obs;
    var tokenAt = _confirmationAPIService.tokenAt.obs;
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
                        await _confirmationAPIService.accessTokenRenew()) {
                      tokenRt.value = _confirmationAPIService.tokenRt;
                      tokenAt.value = _confirmationAPIService.tokenAt;
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
