import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/web_socket.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/myAppBar.dart';
import 'package:megaohm_app/widgets/pages/connect_device_to_internet_page/controller/connect_device_controller.dart';
import 'package:megaohm_app/widgets/pages/connect_device_to_internet_page/controller/web_socket_controller.dart';

class ConnectDeviceToTheInternet extends StatelessWidget {
  ConnectDeviceToTheInternet({Key? key}) : super(key: key);
  final ConnectDeviceController _connectDeviceController = Get.find();
  final AddDeviceWebSocket _addDeviceWebSocket = Get.find();
  final WebSocketController _webSocketController = Get.find();
  final ForAllForms _forAllForms = Get.find();

  @override
  Widget build(BuildContext context) {
    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    final double height = _forAllForms.height;
    final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;

    connectToWebSocket() async {
        await _addDeviceWebSocket.connectToSocket();
    }

    connectToWebSocket();

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "addingADevice".tr,
        actions: [
          IconButton(
            icon: Icon(Icons.repeat,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () async {
              connectToWebSocket();
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
                      'ШАГ 2:',
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'Ваша Флора умеет',
                      style: const TextStyle(
                        // color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'подключаться к Интернету',
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
                                'Введите название и пароль точки\nдоступа WI-FI, к которой можно\nподключить контроллер:',
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
                              await _webSocketController.sendMessage('inet') &&
                              await _webSocketController.sendMessage('reset')) {

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
