import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/parts/internet_check.dart';
import 'package:megaohm_app/widgets/navigation/systemBar.dart';

class TermsPageView extends StatelessWidget {
  TermsPageView({Key? key}) : super(key: key);
  InternetCheck internetCheck = Get.find();
  double vertical = 5;
  double horizontal = 17;
  double height = 54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SysBar(),
      // drawer: const NavDrawer(),
      body: Center(
        child: Wrap(
          children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: vertical, horizontal: horizontal),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.clip,
                                  'userAgreementTerms'.tr,
                                  style: const TextStyle(
                                    // color: Get.isDarkMode ? Colors.white : Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: vertical, horizontal: horizontal),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Flexible(
                            child: Text("A looooooooooooooooooong "
                                "textA "
                                "textA "
                                "textA "
                                "textA "
                                "textA "
                                "textA "
                                "textA "
                                "looooooooooooooooooong textA "
                                "looooooooooooooooooong textA "
                                "looooooooooooooooooong textA "
                                "looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong "
                                "textA looooooooooooooooooong text"),
                          ),
                        ],
                      ),
                    ),
              ],
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
