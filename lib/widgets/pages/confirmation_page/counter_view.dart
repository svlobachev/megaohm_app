import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'confirmation_page_api_service.dart';

class MyCounter extends StatelessWidget {
  final ClickInternetCheck _clickInternetCheck = Get.find();
  final ConfirmationAPIService confirmationAPIService = Get.find();
  final MySnackBarGet _mySnackBarGet = Get.find();
  var _onVisibleFooter = false.obs;
  var _onCounter = ''.obs;
  var _onCounterTime = 60.obs;
  final int _onCounterStep = 0;

  counter() async {
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

  @override
  Widget build(BuildContext context) {
    counter();
    return SingleChildScrollView(
      // padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
      child: Column(
        children: [
          const SizedBox(height: 10),

          // maintainSize: true,

          Obx(
            () => Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: _onVisibleFooter.value ? false : true,
              child: TextButton(
                child: Text(
                  'get'.tr,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    // color: Theme.of(context).colorScheme.onPrimary,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () async {
                  if (await _clickInternetCheck.initConnectivity() &&
                      await confirmationAPIService.codeResend()) {
                    counter();
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
              child: TextButton(
                onPressed:
                    (){
                  _mySnackBarGet.mySnackBar(
                    text: 'serverNotReady'.tr,
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  );
                },
                child: Obx(
                  () => Text(
                    _onCounter.value,
                    style: GoogleFonts.roboto(
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
