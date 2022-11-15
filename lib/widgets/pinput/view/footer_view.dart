
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megaohm_app/app_settings/parts/internet_check.dart';
import 'package:megaohm_app/widgets/pages/login_page/login_page_controller.dart';

class OtpFooter extends StatelessWidget {
  var _onVisibleFooter = false.obs;
  var _onCounter = ''.obs;
  var _onCounterTime = 10.obs;
  final int _onCounterStep = 0;
  final InternetCheck internetCheck = Get.find();
  LoginPageController loginPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 10),

          // maintainSize: true,

          Obx(
            () => Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: _onVisibleFooter.value ? false : true,
              child: ElevatedButton(
                child: Text(
                  'get'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                onPressed: () async {
                  if (await internetCheck.initConnectivity()) {
                    _onVisibleFooter.value = true;
                    for (var i = _onCounterTime.value; i > 0; i--) {
                      _onCounter.value = "$i";
                      await Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          if (i == 1) {
                            _onVisibleFooter.value = false;
                          }
                        },
                      );
                    }
                    _onCounterTime.value += _onCounterStep;
                  }
                },
              ),
            ),
          ),
          Obx(
            () => Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: _onVisibleFooter.value ? true : false,
              child: ElevatedButton(
                onPressed: null,
                child: Obx(
                  () => Text(
                    _onCounter.value,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
