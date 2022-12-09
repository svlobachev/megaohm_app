import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/web_socket.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/pages/add_device_page/controller/add_device_page_controller.dart';
import 'package:megaohm_app/widgets/pages/add_device_page/service/iot_wifi_access_point.dart';
import 'package:megaohm_app/widgets/pages/add_device_page/service/string_parser_from_qr_code.dart';

class AddDeviceView extends StatelessWidget {
  AddDeviceView({Key? key}) : super(key: key);
  final StringParserFromQRCode _stringParserFromQRCode = Get.find();
  final AddDeviceController _addDeviceController = Get.find();
  final ForAllForms _forAllForms = Get.find();
  final IotWiFiAccessPoint _iotWiFiAccessPoint = Get.find();
  AddDeviceWebSocket _addDeviceWebSocket = Get.find();
  Map _backMap = {};
  RxString _SSID = ''.obs;
  RxString _PSWRD = ''.obs;

  @override
  Widget build(BuildContext context) {
    dataFromCamera() async {
      if (Get.arguments != null) {
        _backMap = _stringParserFromQRCode.parseString(Get.arguments);
        _SSID.value = _backMap['SSID'];
        _PSWRD.value = _backMap['PSWRD'];
        _addDeviceController.SSIDFieldIsFilled = _SSID.value;
        _addDeviceController.PSWRDFieldIsFilled = _PSWRD.value;
        _iotWiFiAccessPoint.ssid = _SSID.value;
        _iotWiFiAccessPoint.password = _PSWRD.value;
        await _iotWiFiAccessPoint.connect();
        Get.toNamed('/connectDeviceToTheInternet');
      }
    }

    dataFromCamera();

    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    final double height = _forAllForms.height;
    final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "addingADevice".tr,
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () async {
              Get.toNamed('/screenScannerPage');
            },
          ),
        ],
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
                      'step_1'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'toConnectToFlora'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'youNeedToEnterDetails'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: vertical, horizontal: horizontal),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'enterSSIDFromLabel'.tr,
                                style: const TextStyle(
                                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                                  // fontSize: 32,
                                  // fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              Text(
                                'enterPSWRDFromLabel'.tr,
                                style: const TextStyle(
                                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                                  // fontSize: 32,
                                  // fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:20),
                          IconButton(
                            // icon: Image.asset(
                            //   ("assets/img/icons8-qr-3.gif"),
                            // ),
                            icon: const Icon(Icons.qr_code_scanner),
                            color: Theme.of(context).colorScheme.secondary,
                            iconSize: 45,
                            onPressed: () async {
                              Get.toNamed('/screenScannerPage');
                            },
                          )
                        ],
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
              child: Obx(
                () => TextFormField(
                  initialValue: _SSID.value,
                  textAlignVertical: TextAlignVertical.top,
                  // maxLength: 6,
                  onChanged: (value) {
                    _addDeviceController.SSIDFieldIsFilled = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: vertical, horizontal: horizontal),
                    labelText: 'SSID',
                  ),
                ),
              ),
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: Obx(
                () => TextFormField(
                  initialValue: _PSWRD.value,
                  textAlignVertical: TextAlignVertical.top,
                  // maxLength: 6,
                  onChanged: (value) {
                    _addDeviceController.PSWRDFieldIsFilled = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: vertical, horizontal: horizontal),
                    labelText: 'PSWRD',
                  ),
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
                          if (_addDeviceController.fieldValidation()) {
                            _iotWiFiAccessPoint.ssid = _SSID.value;
                            _iotWiFiAccessPoint.password = _PSWRD.value;
                            await _iotWiFiAccessPoint.connect();
                            _addDeviceWebSocket.connectToSocket();
                            Get.toNamed('/connectDeviceToTheInternet');
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
