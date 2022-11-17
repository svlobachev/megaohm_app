import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/parts/internet_check.dart';
import 'package:megaohm_app/widgets/navigation/systemBar.dart';

class ConformationPageView extends StatelessWidget {
   ConformationPageView({Key? key}) : super(key: key);
   InternetCheck internetCheck = Get.find();
  double vertical = 5;
  double horizontal = 17;
  double height = 54;

  @override
  Widget build(BuildContext context) {
    return      Scaffold(
      appBar: const SysBar(),
      // drawer: const NavDrawer(),
      body:  Center(
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
                          Image.asset(
                            'assets/img/back_arrow.png',
                            height: 16,
                          ),
                          Text(
                            '   '+'registration'.tr,
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
                height: height,
                padding: EdgeInsets.symmetric(
                    vertical: vertical, horizontal: horizontal),
                child: TextFormField(
                  onChanged: (value) {
                    // loginPageController.nameFieldIsFilled = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
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
                          // onPressed: () => Get.toNamed('/learning_page2'),

                          onPressed: () async {
                            if (await internetCheck.initConnectivity()) {
                              // loginPageController.checkFields()
                              //     ? Get.offNamed('/mainPage')
                              //     : null;
                            }
                          },
                          child: Text('confirm'.tr),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
            ],
          ),
        ),
    );
  }
}
