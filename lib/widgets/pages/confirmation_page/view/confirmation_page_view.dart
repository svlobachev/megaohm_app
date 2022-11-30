import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/systemBar.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/service/confirmation_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/controller/confirmation_page_controller.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/model/confirmation_page_model.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/view/confirmation_page_counter_view.dart';



class ConformationPageView extends StatelessWidget {
  ConformationPageView({Key? key}) : super(key: key);
  final ClickInternetCheck _clickInternetCheck = Get.find();
  final ConfirmationAPIService _confirmationAPIService = Get.find();
  final ConfirmationPageController _confirmationPageController = Get.find();
  final ConfirmationPageModel _confirmationPageModel = Get.find();
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
                    Row(
                      children: [
                        // Image.asset(
                        //   'assets/img/back_arrow.png',
                        //   height: 16,
                        // ),
                        Text(
                          'registration'.tr,
                          style: const TextStyle(
                            // color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: vertical, horizontal: horizontal),
                      child: Text(
                        'EnterCode'.tr,
                        style: const TextStyle(
                          // color: Get.isDarkMode ? Colors.white : Colors.black,
                          // fontSize: 32,
                          // fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              key: UniqueKey(),
              height: height + 15,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                maxLength: 6,
                onChanged: (value) {
                  _confirmationPageController.codeFieldIsFilled = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: vertical, horizontal: horizontal),
                  labelText: 'code'.tr,
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
                        onPressed: () async {
                          if (await _clickInternetCheck.initConnectivity() &&
                              _confirmationPageController.fieldValidation() &&
                              await _confirmationAPIService
                                  .confirmUserRegistration()) {
                            _confirmationPageModel.registrationCompleted();
                            Get.offAllNamed('/mainPage');
                          }
                        },
                        child: Text('confirm'.tr),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: horizontal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCounter(),
                  ],
                )),
            SizedBox(
              height: bottomSizedBox,
            ),
          ],
        ),
      ),
    );
  }
}
