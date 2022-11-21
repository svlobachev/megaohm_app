import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_services/internet_check.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/navigation/systemBar.dart';

import 'counter_view.dart';

class ConformationPageView extends StatelessWidget {
   ConformationPageView({Key? key}) : super(key: key);
   final InternetCheck _internetCheck = Get.find();
   final ForAllForms _forAllForms = Get.find();

  @override
  Widget build(BuildContext context) {
    final double vertical = _forAllForms.vertical;
    final double horizontal = _forAllForms.horizontal;
    final double height = _forAllForms.height;
    final double bottomSizedBox = _forAllForms.bottomSizedBoxHeight;



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
                            if (await _internetCheck.initConnectivity()) {
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
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCounter(),
                    ],
                  )
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
