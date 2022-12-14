import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/web_socket.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/add_device_page/controller/add_device_page_controller.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/add_device_page/service/wifi_iot.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/connect_device_to_internet_page/controller/connect_device_controller.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/connect_device_to_internet_page/service/web_socket_service.dart';
// import '../../add_device_page/service/iot_wifi_access_point.dart';

class ConnectDeviceToTheInternet extends StatelessWidget {
  ConnectDeviceToTheInternet({Key? key}) : super(key: key);
  final ConnectDeviceController _connectDeviceController = Get.find();
  final AddDeviceController _addDeviceController = Get.find();
  final AddDeviceWebSocket _addDeviceWebSocket = Get.find();
  final WebSocketService _webSocketService = Get.find();
  final ForAllForms _forAllForms = Get.find();
  final WiFiIoT _wiFiIoT = WiFiIoT();
  // IotWiFiAccessPoint _iotWiFiAccessPoint = Get.find();

  @override
  Widget build(BuildContext context) {
    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    final double height = _forAllForms.height;
    final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;


    // connectToWebSocket() async {
    //   if (await _addDeviceWebSocket.connectToSocket(showAllSnackBar: false, showOnlySuccessfulSnackBar: true)) {
    //     return true;
    //   }
    //   Future.delayed(Duration(milliseconds: 1000),() async {
    //     await connectToWebSocket();
    //   });
    //   return false;
    // }
    // connectToWebSocket();

    _addDeviceWebSocket.connectToSocket(onlyShowsFailedSnackBar: true);

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "addingADevice".tr,
        actions: [
          IconButton(
            icon: Icon(Icons.repeat,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () async {
               _addDeviceWebSocket.connectToSocket(showAllSnackBar: true);
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
                      'step_2'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'yourFloraCan'.tr,
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'connectToTheInternet'.tr,
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
                                'enterTheNameAndPasswordOfTheWIFIHotspot'.tr,
                                style: const TextStyle(
                                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                                  // fontSize: 32,
                                  // fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
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
              child: TextFormField(
                initialValue: _connectDeviceController.SSIDFieldIsFilled,
                textAlignVertical: TextAlignVertical.top,
                // maxLength: 6,
                onChanged: (value) {
                  _connectDeviceController.SSIDFieldIsFilled = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: vertical, horizontal: horizontal),
                  labelText: 'Название Wi-Fi',
                ),
              ),
            ),
            Container(
              key: UniqueKey(),
              height: height,
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: TextFormField(
                initialValue: _connectDeviceController.PSWRDFieldIsFilled,
                textAlignVertical: TextAlignVertical.top,
                // maxLength: 6,
                onChanged: (value) {
                  _connectDeviceController.PSWRDFieldIsFilled = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: vertical, horizontal: horizontal),
                  labelText: 'Пароль',
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
                          if (_connectDeviceController.fieldValidation() &&
                              _addDeviceWebSocket.isConnected &&
                              await _webSocketService.sendMessage('inet') &&
                              await _webSocketService.sendMessage('reset')) {
                            _connectDeviceController.SSIDFieldIsFilled ='';
                            _connectDeviceController.PSWRDFieldIsFilled ='';
                            _addDeviceController.SSIDFieldIsFilled ='';
                            _addDeviceController.PSWRDFieldIsFilled ='';
                            await _wiFiIoT.removeWifiNetwork();
                            Get.offAllNamed('/myDevices');
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
