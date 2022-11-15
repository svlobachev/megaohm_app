import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/parts/internet_check.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';
import 'package:megaohm_app/widgets/pinput/view/pinput_view.dart';

import '../../navigation/navDrawer.dart';
import '../../navigation/systemBar.dart';
import 'login_page_controller.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  InternetCheck internetCheck = Get.find();
  LoginPageController loginPageController = Get.find();
  MySnackBarGet mySnackBarGet = Get.find();
  String _fieldValue = '';
  FocusNode focusNodeField = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNodeField.addListener(_focusNodeFieldState);
  }
  bool _focusNodeFieldState() {
    loginPageController.focusNodeField = focusNodeField.hasFocus;
    loginPageController.showsSnackBar();
    bool result = focusNodeField.hasFocus;
    if (kDebugMode) print("Focus of email & phone field: $result");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // final SessionController _session = Get.find();
    // _session.sessionControl()

    // var isChecked = false.obs;
    // final _onVisible = true.obs;
    double vertical = 10;
    double horizontal = 20;
    double height = 70;

    // const TextStyle textStyle = TextStyle(color: Color(0xDE000000));
    // const TextStyle linkStyle = TextStyle(
    //     shadows: [
    //       Shadow(
    //         color: Color(0xFF007881),
    //         offset: Offset(0, -1),
    //       )
    //     ],
    //     color: Colors.transparent,
    //     decoration: TextDecoration.underline,
    //     decorationColor: Color(0xFF007881),
    //     decorationThickness: 2);

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
                        'enter'.tr,
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
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
                  autofocus: true,
                  focusNode: focusNodeField,
                  onChanged: (value) {
                    _fieldValue = value;
                    loginPageController.isFilled = _fieldValue;

                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'EmailOrPhoneNumber'.tr,
                  ),
                ),
              ),

              Container(
                key: UniqueKey(),
                padding: EdgeInsets.symmetric(
                    vertical: vertical, horizontal: horizontal),
                child: Column(
                  children: [
                    PinPutView(),
                  ],
                ),
              ),

              // Container(
              //   key: UniqueKey(),
              //   padding: EdgeInsets.symmetric(
              //       vertical: vertical, horizontal: horizontal),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Obx(
              //             () => Checkbox(
              //               // checkColor: Colors.white,
              //               activeColor:
              //                   Theme.of(context).colorScheme.secondary,
              //               value: isChecked.value,
              //               onChanged: (bool? value) {
              //                 isChecked.value = value!;
              //               },
              //             ),
              //           ),
              //           Text('iHaveReadAndAccept'.tr, style: textStyle),
              //         ],
              //       ),
              //       const SizedBox(height: 0.0),
              //       GestureDetector(
              //         onTap: () {},
              //         child: Text('userAgreementTerms'.tr, style: linkStyle),
              //       )
              //     ],
              //   ),
              // ),

              // Container(
              //   padding: EdgeInsets.symmetric(
              //       vertical: vertical, horizontal: horizontal),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Expanded(
              //         child: Container(
              //           key: UniqueKey(),
              //           height: height,
              //           padding: EdgeInsets.symmetric(
              //               vertical: vertical, horizontal: horizontal),
              //           child: ElevatedButton(
              //             // onPressed: () => Get.toNamed('/learning_page2'),
              //
              //             onPressed: () {
              //               internetCheck.initConnectivity();
              //               loginPageController.isChecked = isChecked.value;
              //               loginPageController.isFilled = _fieldValue;
              //               loginPageController.showsSnackBar();
              //             },
              //             child: Text('toComeIn'.tr),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.symmetric(
              //           vertical: 0, horizontal: horizontal),
              //       child: TextButton(
              //         onPressed: () => Get.toNamed('/learning_page2'),
              //         child: Text('registration'.tr),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 180,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
