import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/internet_check.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/systemBar.dart';

import 'login_page_controller.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({Key? key}) : super(key: key);

  final InternetCheck _internetCheck = Get.find();
  final LoginPageController _loginPageController = Get.find();
  final ForAllForms _forAllForms = Get.find();

  @override
  Widget build(BuildContext context) {
    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    final double height = _forAllForms.height;
    final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;

    return Scaffold(
      appBar: const SysBar(),
      // drawer: const NavDrawer(),
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
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                onChanged: (value) {
                  _loginPageController.emailFieldIsFilled = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email'.tr,
                ),
              ),
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                onChanged: (value) {
                  _loginPageController.phoneFieldIsFilled = value;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'PhoneNumber'.tr,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      key: UniqueKey(),
                      height: height,
                      padding: EdgeInsets.symmetric(
                          vertical: vertical, horizontal: 0),
                      child: ElevatedButton(
                        // onPressed: () => Get.toNamed('/learning_page2'),

                        onPressed: () async {
                          if (await _internetCheck.initConnectivity()) {
                            _loginPageController.fieldValidation()
                                ? {Get.toNamed('/conformation')}
                                : null;
                          }
                        },
                        child: Text('toComeIn'.tr),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    key: UniqueKey(),
                    height: height,
                    padding:
                        EdgeInsets.symmetric(vertical: vertical, horizontal: 0),
                    child: TextButton(
                      onPressed: () async {
                        if (await _internetCheck.initConnectivity()) {
                          Get.toNamed('/registration');
                        }
                      },
                      child: Text('doRegistration'.tr),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(
              height: bottomSizedBox,
            ),
          ],
        ),
      ),
    );
  }
}
