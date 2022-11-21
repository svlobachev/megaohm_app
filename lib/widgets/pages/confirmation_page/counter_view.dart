import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megaohm_app/app_services/internet_check.dart';

class MyCounter extends StatelessWidget {
  var _onVisibleFooter = false.obs;
  var _onCounter = ''.obs;
  var _onCounterTime = 60.obs;
  final int _onCounterStep = 0;
  final InternetCheck _internetCheck = Get.find();

  @override
  Widget build(BuildContext context) {

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
                  if (await _internetCheck.initConnectivity()) {
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
              child: TextButton(
                onPressed: null,
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
