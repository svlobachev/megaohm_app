import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';
import 'package:pinput/pinput.dart';

import 'footer_view.dart';

class PinPutView extends StatelessWidget {
  PinPutView({Key? key}) : super(key: key);
  Box box = Hive.box('RegistrationBox');
  MySnackBarGet mySnackBarGet = Get.find();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          // color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    var color2 = Theme.of(context).colorScheme.primaryContainer;
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: color2),
      borderRadius: BorderRadius.circular(4),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'enterСodeText'.tr,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            // color: const Color.fromRGBO(133, 153, 170, 1),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          validator: (shortcode) {
            if (shortcode != box.get('registrationPinCode')) {
              mySnackBarGet.mySnackBar(
                'pinIsIncorrect',
                const Icon(
                  Icons.fiber_pin,
                  color: Colors.red,
                  size: 30.0,
                ),
              );
            }

            box.put('serverUserUuid', box.get('tempServerUserUuid'));
            box.delete('tempServerUserUuid');
            box.put('registrationComplete', 'true');
            // Get.offNamed('/mainPage');
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) {
            if (kDebugMode) {
              print(pin);
            }
          },
        ),
        const SizedBox(height: 14),
        OtpFooter(),
      ],
    );
  }
}
