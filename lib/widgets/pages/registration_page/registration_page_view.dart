import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/parts/internet_check.dart';
import 'package:megaohm_app/widgets/navigation/navDrawer.dart';
import 'package:megaohm_app/widgets/navigation/systemBar.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'registration_page_controller.dart';

class RegistrationPageView extends StatefulWidget {
  const RegistrationPageView({Key? key}) : super(key: key);

  @override
  State<RegistrationPageView> createState() => RegistrationPageViewState();
}

class RegistrationPageViewState extends State<RegistrationPageView> {
  final _formKey = GlobalKey<FormState>();
  InternetCheck internetCheck = Get.find();
  RegistrationPageController loginPageController = Get.find();
  MySnackBarGet mySnackBarGet = Get.find();

  @override
  Widget build(BuildContext context) {
    // final SessionController _session = Get.find();
    // _session.sessionControl()

    var isChecked = false.obs;
    double vertical = 5;
    double horizontal = 17;
    double height = 54;

    const TextStyle textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
    TextStyle linkStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.tertiary,
            offset: const Offset(0, -1),
          )
        ],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: Theme.of(context).colorScheme.tertiary,
        decorationThickness: 2);

    return Scaffold(
      appBar: const SysBar(),
      drawer: const NavDrawer(),
      body: Form(
        key: _formKey,
        child: Center(
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                ],
              ),
              Container(
                key: UniqueKey(),
                height: height,
                padding: EdgeInsets.symmetric(
                    vertical: vertical, horizontal: horizontal),
                child: TextFormField(
                  onChanged: (value) {
                    loginPageController.nameFieldIsFilled = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'yourName'.tr,
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
                    loginPageController.emailFieldIsFilled = value;
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
                    loginPageController.phoneFieldIsFilled = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'PhoneNumber'.tr,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Checkbox(
                          // checkColor: Colors.white,
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: isChecked.value,
                          onChanged: (bool? value) {
                            loginPageController.isChecked = value!;
                            isChecked.value = value;
                          },
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('iHaveReadAndAccept'.tr, style: textStyle),
                            GestureDetector(
                                onTap: () {},
                                child: Text('userAgreementTerms'.tr,
                                    style: linkStyle))
                          ])
                    ]),
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

                          onPressed: () {
                            internetCheck.initConnectivity();
                            loginPageController.checkFields() ? Get.offNamed('/mainPage') : null;
                          },
                          child: Text('doRegistration'.tr),
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
      ),
    );
  }
}
