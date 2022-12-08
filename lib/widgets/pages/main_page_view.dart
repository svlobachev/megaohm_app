import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
// import 'package:megaohm_app/app_services/HTTP_Dio/access_token_renew.dart';
// import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/navDrawer_view.dart';
import '../navigation/myAppBar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  // final ClickInternetCheck _clickInternetCheck = Get.find();
  // final AccessTokenRenew _accessTokenRenew = Get.find();
  final ForAllForms _forAllForms = Get.find();
  // final Box _registrationBox = Hive.box('RegistrationBox');
  final Box _testBox = Hive.box('TestBox');




  @override
  Widget build(BuildContext context) {
    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    // final double height = _forAllForms.height;
    // final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;

    // String _tokenRt = _registrationBox.get("tokenRt");
    // String _tokenAt = _registrationBox.get("tokenAt");
    // var tokenRt = _tokenRt.obs;
    // var tokenAt = _tokenAt.obs;
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "appBarTitle".tr, actions: null,),
      drawer: NavDrawer(),
      body: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: vertical, horizontal: horizontal),
          child: Center(
            child: Column(
              children: [
                const Text("Добро пожаловать!"),
                SizedBox(height: vertical),
                TextFormField(
                  initialValue: _testBox.get('ip'),
                  textAlignVertical: TextAlignVertical.top,
                  // maxLength: 6,
                  onChanged: (value) {
                    _testBox.put('ip', value);
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: vertical, horizontal: horizontal),
                    labelText: 'IP контроллера',
                  ),
                ),
                SizedBox(height: vertical),
                // ElevatedButton(
                //   onPressed: () async {
                //     if (await _clickInternetCheck.initConnectivity() &&
                //         await _accessTokenRenew.accessTokenRenew()) {
                //       tokenRt.value = _accessTokenRenew.tokenRt;
                //       tokenAt.value = _accessTokenRenew.tokenAt;
                //     }
                //   },
                //   child: const Text("Обновить"),
                // ),
                // Obx(
                //   () => Text("tokenRt --> $tokenRt" ,
                //     overflow: TextOverflow.clip),
                // ),
                // Obx(
                //   () => Text("tokenAt --> $tokenAt"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
