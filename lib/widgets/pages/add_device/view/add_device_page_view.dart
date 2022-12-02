import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/pages/add_device/controller/add_device_page_controller.dart';

class AddDeviceView extends StatelessWidget {
  AddDeviceView({Key? key}) : super(key: key);
  final ClickInternetCheck _clickInternetCheck = Get.find();
  final AddDeviceController _addDeviceController = Get.find();

  final ForAllForms _forAllForms = Get.find();

  @override
  Widget build(BuildContext context) {
    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    final double height = _forAllForms.height;
    final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "addingADevice".tr,
        actions: null,
      ),
      // drawer:  NavDrawer(),
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
                      'toConnectToFlora'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'youNeedToEnterYourDetails'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: vertical, horizontal: horizontal),
                      child: Text(
                        'enterSSIDAndPSWRDFromLabel'.tr,
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
              height: height,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                // maxLength: 6,
                onChanged: (value) {
                  _addDeviceController.SSIDFieldIsFilled = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: vertical, horizontal: horizontal),
                  labelText: 'SSID',
                ),
              ),
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                // maxLength: 6,
                onChanged: (value) {
                  _addDeviceController.PSWRDFieldIsFilled = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: vertical, horizontal: horizontal),
                  labelText: 'PSWRD',
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
                              _addDeviceController.fieldValidation()) {
                            Get.offAllNamed('/mainPage');
                          }
                        },
                        child: Text('connect'.tr),
                      ),
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
